import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/views/miniAcc/controller/virtual_card_controller%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../model/billpay/GetCategoriesBean.dart';
import '../../../model/transaction/fetch_card_limit_model.dart';
import '../../../model/wallet/CheckUserRequestModelPayu.dart';
import '../../../model/wallet/CheckUserResponseModelPayu.dart';
import '../../../model/wallet/point_balance_model.dart';
import '../../../prefrences/session_manager.dart';
import '../../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/routes/routes_name.dart';

class AccountDetailsController extends GetxController {
  final MiniAccountRepo repository = MiniAccountRepo();

  RxBool isLoading = true.obs;
  List<int> amounts = [500, 1000, 2000];
  RxInt selectedAmount = 0.obs;

  var userRetriveData = CheckUserResponseModelPayu().obs;
  List<PaymentCard>? cardListData = <PaymentCard>[].obs;
  List<results> billIconData = <results>[].obs;
  PaymentCard? cardDetails;
  List<Subwallet>? walletDetails;

  final List<String> servicesimagepath = [
    'assets/images/credit-card3.png',
    'assets/images/recharges_db.png',
    'assets/images/mutual-fund.png',
  ];
  final List<String> servicestext = [
    "ATM",
    "Recharge",
    "Mutual Funds",
  ];

  TextEditingController amountController = TextEditingController();

  RxString coinsBalance = '0'.obs;

  @override
  void onInit() {
    super.onInit();

    // selectedAmount.value = amounts[0];

    // amountController.text = selectedAmount.value.toString();

    getCustomerRecord();
    callBillPaymentApiData();

    // getPointBalance2();
  }

  Future<void> getPointBalance() async {
    try {
      PointBalanceRequestModel data = PointBalanceRequestModel(
          mobile: SessionManager().getMobile(),
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()));

      PointBalanceResponseModel response = await repository.getPointBalance(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

      if (response.status.toString() == '1') {
        coinsBalance.value = response.point ?? "0";
        SessionManager().addAntCoinsMoney(response.point ?? "0");
      } else {
        coinsBalance.value = '0';
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      // isLoading.value = false;
    }
  }

  @override
  void onClose() {
    if (Get.isRegistered<AccountDetailsController>()) {
      Get.delete<AccountDetailsController>();
    }
    super.onClose();
  }

  setAmount(int amount) {
    selectedAmount.value = amount;
    amountController.text = amount.toString();
  }

  chnageAmountField(String value) {
    selectedAmount.value = int.tryParse(value) ?? 0;
    amountController.text = value.toString();
  }

  handelCardClick() {
    Get.toNamed(RoutesName.coinPage);
  }

  void getCustomerRecord() async {
    try {
      isLoading.value = true;

      CheckUserRequestModelPayu data = CheckUserRequestModelPayu(
        messageCode: "",
        clientTxnId: "",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        customerMobile: SessionManager().getMobile().toString(),
      );

      final response = await repository.getCustomerRecord(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.responseCode.toString() == '00') {
        userRetriveData(response);
        if (response.cardList != null) {
          cardListData!.assignAll(userRetriveData.value.cardList!);
        }
        if (response.isMpinSet != null) {
          if (response.isMpinSet!)
            SessionManager().addPayUMpinExpiryStatus(response.mpinExpired!);
        }

        if (response.mpinExpired != null)
          SessionManager().addPayUMpinStatus(response.mpinExpired!);

        cardDetails = response.cardList?.first;
        walletDetails = response.cardList?.first.subwalletListDetails;
        String? status = cardDetails?.statusDescription;

        SessionManager().addPayUCustomerDetails(
          customerId: response.customerId!,
          clientId: response.clientId!,
          urn: cardDetails!.urn!.toString(),
          email: response.email!,
          cardNumber: cardDetails!.cardNumber!,
          last4Digits: cardDetails!.lastFourDigit!,
          kycType: response.kycName!,
          uniqueNumberValidity: cardDetails!.uniqueNumberValidity!,
          walletAccountNumber: walletDetails!.first.accountNumber!,
          walletId: walletDetails!.first.subwalletId!,
          accountBalance: CommonUtils.convertAmountToRupees(
              cardDetails!.availableBalance!.toString()),
          walletStatus: status!,
        );
      } else {
        userRetriveData(null);
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void callBillPaymentApiData() async {
    try {
      isLoading.value = true;

      final response = await repository.getBillPaymentApiData(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
      );
      if (response.schemesList.isNotEmpty) {
        billIconData.assignAll(response.schemesList);
        getPointBalance();
      } else {
        billIconData.clear();
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹ ',
    decimalDigits: 2,
  );

  void clickManageTransctionLimit() {
    if (cardDetails != null && SessionManager().getPayUCustomerId() != null) {
      fetchCardLimitApi();
    }else{
      CustomToast.show("Create your mini account");

    }
  }

  void fetchCardLimitApi() async {
    isLoading.value=true;
    try {
      // isLoading.value = true;

       FetchCardLimitReqModel data = FetchCardLimitReqModel(
        urn: SessionManager().getPayUCustomerUrn(),
        customerId: SessionManager().getPayUCustomerId(),
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        // mobile: SessionManager().getMobile().toString(),
      );

      final response = await repository.getCardLimitApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.responseCode.toString()=="00") {
    Get.toNamed(RoutesName.transactionLimitPage);

        
      } else {
        //  Get.toNamed(RoutesName.transactionLimitPage);
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void handelBillPaymentCardClick(String? service_name) {



      
    if (service_name == "LPG") {
      service_name = "LPG GAS";
    }

         SessionManager().addServicetype(service_name!);
      SessionManager().addFromScreen('allbillpay');

    if (service_name == "PostPaid") {
      Get.toNamed(RoutesName.postPaidFragmentScreen);
    } else if (service_name == "NCMC Recharge") {
      Get.toNamed(RoutesName.ncmcmetrorechargescreen);
      // CustomToast.show("Comming soon");
    } else {
      Get.toNamed(RoutesName.bharatBillPayTemplateView);
    }

      

  }
}
