import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_fetch_beneficiary.dart';
import 'package:antpay_lite/model/WalletTransfer/add_wallet_beneficiary_reponse.dart';
import 'package:antpay_lite/model/WalletTransfer/add_wallet_beneficiary_request.dart';
import 'package:antpay_lite/model/wallet/CheckUserRequestModelPayu.dart';
import 'package:antpay_lite/model/wallet/CheckUserResponseModelPayu.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/common_utils.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletTranferBeneficaillyController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final MiniAccountRepo repository = MiniAccountRepo();
  var userRetriveData = CheckUserResponseModelPayu().obs;
  List<PaymentCard>? cardListData = <PaymentCard>[].obs;
  PaymentCard? cardDetails;
  List<Subwallet>? walletDetails;
  String? kycResponseCode;
  String? kycAccountStatus;
  String? kycName;
  final pageController = PageController();
  RxBool isCardShow = false.obs;
  RxBool isnewuser = false.obs;

  RxBool isLoading = false.obs;
  var hasRecords = true.obs;
  var isScreenLoading = true.obs;

  var beneficiaryList = <BeneficiaryData>[].obs;

  late CustomerFetchBeneficiaryResponse beneficiaryResponse;
  CommonApiRepo repoclass = CommonApiRepo();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isScreenLoading.value = true;

      final request = CustomerFetchBeneficiaryRequest(
        activationStatus: "ALL",
        clientTxnId: "",
        messageCode: "",
        requestDateTime: "",
        urn: 1003031,
        transferType: "FT",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      );

      final response = await repoclass.apiClient.CustomerFetchBeneficiary(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request,
      );

      if (response.beneficiaryDataList != null) {
        SessionManager().addCustomerId(response.customerId.toString());

        final filteredList = response.beneficiaryDataList!
            .where((e) => e.beneficiaryTypeCode == 3)
            .toList();

        beneficiaryList.assignAll(filteredList);
        hasRecords.value = filteredList.isNotEmpty;
      } else {
        hasRecords.value = false;
        beneficiaryList.clear();
      }
    } catch (e) {
      print("Error loading beneficiary: $e");
      hasRecords.value = false;
      beneficiaryList.clear();
    } finally {
      isScreenLoading.value = false;
    }
  }

  void getCustomerRecord(String mobilenumber) async {
    try {
      isLoading.value = true;

      CheckUserRequestModelPayu data = CheckUserRequestModelPayu(
        messageCode: "",
        clientTxnId: "",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        customerMobile: mobilenumber,
      );

      CheckUserResponseModelPayu response = await repository.getCustomerRecord(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );

      if (response.responseCode.toString() == '00') {
        SessionManager().addKYC(response.kycName.toString());
        isCardShow.value = true;
        isnewuser.value = false;
        kycResponseCode = response.responseCode.toString();
        kycName = response.kycName.toString();
        kycAccountStatus =
            response.cardList!.first.subwalletListDetails!.first.accountStatus;
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

        SessionManager().addwallettranferReceiver(
          walletTranferurn: cardDetails!.urn!.toString(),
          walletTranferAccountNumber: walletDetails!.first.accountNumber!,
        );
      } else {
        userRetriveData(null);
      }
    } catch (e) {
      // CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<CustomerFetchBeneficiaryResponse?> send2FAOtp(String action) async {
    try {
      var response = await repoclass.send2FAOtp({
        "customerMobile": SessionManager().getMobile().toString(),
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString())
      }, action);

      if (response.responseCode == "00") {
        switch (action) {
          case "SET":
            Get.toNamed(RoutesName.resetMpin, arguments: "SET");
            break;
          case "RESET":
            Get.toNamed(RoutesName.resetMpin, arguments: "RESET");
            break;
          case "VERIFY":
            Get.toNamed(RoutesName.resetMpin, arguments: "VERIFY");
            break;
          case "FORGOT":
            Get.toNamed(RoutesName.resetMpin, arguments: "FORGOT");
            break;
        }
      } else {
        CustomToast.show(response.responseMessage);
      }
    } catch (e) {
      CustomToast.show("Something went wrong!");
      debugPrint(e.toString());
    } finally {}
    return null;
  }

  Future<void> addBeneficiary() async {
    try {
      WalletAddBenficiaryRequestModel request = WalletAddBenficiaryRequestModel(
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          customerMobile: SessionManager().getMobile().toString(),
          beneficiaryMobileNumber: mobileController.text,
          customerId: SessionManager().getPayUCustomerId(),
          beneficiaryName: nameController.text,
          groupName: "Other",
          clientTxnId: "",
          messageCode: "",
          requestDateTime: "",
          beneficiaryTypeCode: 3);
      WalletAddBenefiaryResponseModel customResponse =
          await CommonApiRepo().apiClient.addwalletBenficiary(
                SessionManager().getToken().toString(),
                AuthToken.getAuthToken(),
                request,
              );
      if (customResponse.responseCode == "00") {
        CustomToast.show("Registerd Beneficiary added successfully");
        nameController.clear();
        mobileController.clear();
        Get.back();
      } else {
        CustomToast.show(customResponse.responseMessage.toString()??"Registerd Beneficiary not added successfully");
        nameController.clear();
        mobileController.clear();
        Get.back();
      }
    } catch (e) {
   
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    mobileController.dispose();
  }
}
