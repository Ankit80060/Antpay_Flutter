import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/payment/generatePayUOrderModel.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/payment_view/payu_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/recharge_model/convenience_model.dart';
import '../../repository/billpay_repository/billpay_repo.dart';

class AddMoneyViewController extends GetxController {
  final payUController = Get.put(PayUController());
  BillPayRepo repository = BillPayRepo();
  RxBool isLoading = false.obs;
  late GeneratePayUOrderModelBean generatePayUOrderModelBean;
  RxString selectedMethod = 'UPI'.obs;
  TextEditingController enteredAmount = TextEditingController();
  // var selectedIndex = 0.obs;
  var selectedIndex = (-1).obs;
  final List<String> amountSuggestions = ['₹ 500', '₹ 1000', '₹ 2000'];
  RxString serviceName = "".obs;
  RxString categoriesType = "".obs;
  RxString feeRatSerType = "".obs;
  RxString payUConvenienceFeeText = "".obs;
  RxString getCommanConvenienceFee = "0".obs;
  RxString totalPayAbleAmount = "0".obs;
  // PG (PayU)
  var payUConvenienceFee = "0".obs;

  // UPI
  var upiConvenienceFeeText = "".obs;
  var upiConvenienceFee = "0".obs;

  // Debit Card
  var dbConvenienceFeeText = "".obs;
  var dbConvenienceFee = "0".obs;

  // Credit Card
  var ccConvenienceFeeText = "".obs;
  var ccConvenienceFee = "0".obs;

  // Net Banking
  var netBankingConvenienceFeeText = "".obs;
  var netBankingConvenienceFee = "0".obs;

  // Other Wallet
  var otherWalletConvenienceFeeText = "".obs;
  var otherWalletConvenienceFee = "0".obs;

  // Wallet
  var walletConvenienceFeeText = "".obs;
  var walletConvenienceFee = "0".obs;

  RxString fromScreen = "".obs;

  @override
  void onInit() {
    super.onInit();

    if (!Get.arguments['isaddmoney']) {
      if (Get.arguments != null && Get.arguments['amount'] != null) {
        enteredAmount.text = Get.arguments['amount'].toString();
      }
    } 
    SessionManager().addChannelType('PG');

    print("Get.arguments ${Get.arguments}");

    if (Get.arguments['isaddmoney'] == true) {
      serviceName.value = "ppi-wallet";
    } else if (Get.arguments != null &&
        Get.arguments['fromPage'] != null &&
        Get.arguments['fromPage'] != "") {
      serviceName.value = Get.arguments['fromPage'];
    } else {
      serviceName.value = "ppi-wallet";
    }
    print("Get.arguments ${serviceName.value}");

    enteredAmount.addListener(() {
      if (enteredAmount.text.isEmpty) {
        selectedIndex.value = -1;
      }
      enteredAmount.value = enteredAmount.value;
    });
    getConvenienceFeeData();
  }

  @override
  void onClose() {
    super.onClose();
    if (Get.isRegistered<AddMoneyViewController>()) {
      Get.delete<AddMoneyViewController>();
    }
  }

  String getBillType(String serviceType) {
    switch (serviceType) {
      case "Cable TV":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "cable-tv";
      case "Clubs and Associations":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "clubs-and-associations";
      case "Donation":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "donation";

      case "Education Fees":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "education-fees";

      case "Electricity":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "electricity";
      case "Gas":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "gas";

      case "Health Insurance":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "health-insurance";
      case "Hospital":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "hospital";
      case "Hospital and Pathology":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "hospital-and-pathology";

      case "Housing Society":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "housing-society";
      case "Life Insurance":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "life-insurance";
      case "Loan Repayment":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "loan-repayment";
      case "LPG Gas":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "lpg-gas";
      case "Motor Insurance":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "motor-insurance";

      case "Municipal Services":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "municipal-services";
      case "Municipal Taxes":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "municipal-taxes";
      case "National Pension System":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "national-pension-system";
      case "NCMC Recharge":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "ncmc-recharge";
      case "Prepaid Meter":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "prepaid-meter";
      case "Recurring Deposit":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "recurring-deposit";

      case "Subscription":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "subscription";

      case "PostPaid":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "postpaid";

      case "Water":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "water";

      case "Credit Card":
        categoriesType.value = "bill_pay";
        feeRatSerType.value = "bill-and-recharge";
        return "credit_card";
      case "Mobile Recharge":
        categoriesType.value = "recharges";
        feeRatSerType.value = "bill-and-recharge";
        return "bill-and-recharge";
      case "DTH Recharge":
        categoriesType.value = "recharges";
        feeRatSerType.value = "dth";
        return "dth";
      case "FastTag":
        categoriesType.value = "recharges";
        feeRatSerType.value = "fastag";
        return "fastag";

      default:
        categoriesType.value = "";
        feeRatSerType.value = "ppi-wallet";
        return "ppi-wallet";
    }
  }

  /// Handle UPI option selection
  void handelChangeUpiSelection(String? val) {
    selectedMethod.value = val ?? 'UPI';

    switch (val) {
      case "UPI":
        calculateTotalAmount(upiConvenienceFee.value);
        break;
      case "Debit Card":
        calculateTotalAmount(dbConvenienceFee.value);

        break;
      case "Credit Card":
        calculateTotalAmount(ccConvenienceFee.value);
        break;
      case "Net Banking":
        calculateTotalAmount(netBankingConvenienceFee.value);
        break;
      case "Other wallet":
        calculateTotalAmount(otherWalletConvenienceFee.value);

        break;

      case "AntPay wallet":
        CustomToast.show("Wallet Integration pending");
        calculateTotalAmount(walletConvenienceFee.value);
        break;
      default:
    }
  }

  String getPaymentMethod() {
    switch (selectedMethod.value) {
      case "UPI":
        return "UPI";
      case "Debit Card":
        return "CARD";
      case "Credit Card":
        return "CARD";
      case "Net Banking":
        return "NB";
      case "Other wallet":
        return "WALLET";

      case "AntPay wallet":
        return "WALLET";
      default:
        return "UPI";
    }
  }

  /// Generate PayU order and open gateway

  generatePayUOrder() async {
// Get.toNamed(RoutesName.amountrechargescreen,arguments: {
//          "fromPage" :"FromMobileRecharge"
//         });

//     return;
    if (selectedMethod.value == "AntPay wallet") {
      CustomToast.show("Wallet Integration pending");
      return;
    }
    // Get.toNamed(RoutesName.bharatBillPayTemplateView);
    // return;
    final repo = CommonApiRepo();
    String sendBillType =
        await getBillType(SessionManager().getServiceType() ?? "");
    String paymentMethod = await getPaymentMethod();

    final data = GeneratePayUOrderModel(
        amount: totalPayAbleAmount.value,
        mobile: SessionManager().getMobile().toString(),
        service: sendBillType??"ppi-wallet",
        channel: SessionManager().getChannelType().toString(),
        source: "Antpay");

    generatePayUOrderModelBean = await repo.apiClient.generatePayUorder(
      data,
      AuthToken.getAuthToken(),
      SessionManager().getToken().toString(),
    );

    if (generatePayUOrderModelBean.status.toString() != '0') {
      SessionManager()
          .addAntTxnId(generatePayUOrderModelBean.antTxnId.toString());
      SessionManager().addamount(totalPayAbleAmount.value);

      SessionManager().addGnerateOrderResponse(
          totalPayAbleAmount.value,
          generatePayUOrderModelBean.orderId.toString(),
          generatePayUOrderModelBean.apiKey.toString(),
          generatePayUOrderModelBean.antTxnId.toString(),
          SessionManager().getChannelType()!,
          sendBillType);
      try {
        payUController.openPaymentGateway(totalPayAbleAmount.value,
            generatePayUOrderModelBean.apiKey.toString(), paymentMethod);
      } catch (e) {
        CustomToast.show("Server Error");
      }
    } else {
      SessionManager().addTranscationResult(AppConstant.RESULT_CANCELED);
      CustomToast.show(generatePayUOrderModelBean.errorMsg.toString());
    }
  }

  void getConvenienceFeeData() async {
    
    var getString = await getBillType(SessionManager().getServiceType() ?? "");

    print("getServiceType $getString  ${SessionManager().getServiceType()}");

    try {
      isLoading.value = true;
      ConvenienceReqData data = ConvenienceReqData(
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        mobile: SessionManager().getMobile().toString(),
        amount: enteredAmount.text.toString(),
        service: feeRatSerType.value,
        version: true,
        categories: categoriesType.value,
      );

      final response = await repository.fetchConvenienceFeeApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.status.toString() == '1') {
        //payU
        payUConvenienceFeeText.value = response.pg!.shortText ?? "";
        payUConvenienceFee.value = response.pg!.feeRate ?? "0";

        //UPI

        upiConvenienceFeeText.value = response.upi!.shortText ?? "";
        upiConvenienceFee.value = response.upi!.feeRate ?? "0";
        calculateTotalAmount(upiConvenienceFee.value);

        // Debit Card

        dbConvenienceFeeText.value = response.pgDc!.shortText ?? "";
        dbConvenienceFee.value = response.pgDc!.feeRate ?? "0";

        // Credi Card

        ccConvenienceFeeText.value = response.pgCc!.shortText ?? "";
        ccConvenienceFee.value = response.pgCc!.feeRate ?? "0";

        //Net Banking

        netBankingConvenienceFeeText.value =
            response.netbanking!.shortText ?? "";
        netBankingConvenienceFee.value = response.netbanking!.feeRate ?? "0";

        // Other Wallet

        otherWalletConvenienceFeeText.value =
            response.otherWallets!.shortText ?? "";
        otherWalletConvenienceFee.value = response.otherWallets!.feeRate ?? "0";

        // Wallet

        walletConvenienceFeeText.value = response.wallet!.shortText ?? "";
        walletConvenienceFee.value = response.wallet!.feeRate ?? "0";
      } else {
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      // CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void calculateTotalAmount(String conExtraFee) {
    double entered = double.tryParse(enteredAmount.text) ?? 0.0;
    double percent = double.tryParse(conExtraFee) ?? 0.0;

    double fee = 0.0;

    if (percent > 0.0) {
      fee = (entered * percent) / 100;
    }

    getCommanConvenienceFee.value = fee.toStringAsFixed(2);
    totalPayAbleAmount.value = (entered + fee).toStringAsFixed(2);
  }

  void handelChangeAmountSelection(int index, String amount) {
    selectedIndex.value = index;
    enteredAmount.text = amount.replaceAll('₹ ', '');

    switch (selectedMethod.value) {
      case "UPI":
        calculateTotalAmount(upiConvenienceFee.value);
        break;
      case "Debit Card":
        calculateTotalAmount(dbConvenienceFee.value);
        break;
      case "Credit Card":
        calculateTotalAmount(ccConvenienceFee.value);
        break;
      case "Net Banking":
        calculateTotalAmount(netBankingConvenienceFee.value);
        break;
      case "Other wallet":
        calculateTotalAmount(otherWalletConvenienceFee.value);
        break;
      case "AntPay wallet":
        CustomToast.show("Wallet Integration pending");
        calculateTotalAmount(walletConvenienceFee.value);
        break;
      default:
      // fallback if no payment method selected
      // calculateTotalAmount(upiConvenienceFee.value);
    }
  }
}
