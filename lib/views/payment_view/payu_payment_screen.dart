import 'dart:convert';

import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

import '../../api/auth_token.dart';
import '../../api/comman_api_repo.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/payment/PayUHashResponse.dart';
import '../../model/payment/PayUStringHash.dart';
import '../../prefrences/session_manager.dart';
import '../../utils/app_constant.dart';

class PayUController extends GetxController implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutPro;

  @override
  void onInit() {
    super.onInit();
    _checkoutPro = PayUCheckoutProFlutter(this);
  }

  /// Open PayU Gateway
  void openPaymentGateway(String amount, String apiKey, String paymentType) {

    // return ;
    try {
      _checkoutPro.openCheckoutScreen(
        payUPaymentParams:
            PayUParams.createPayUPaymentParams(amount, apiKey, paymentType),
        payUCheckoutProConfig: PayUParams.createPayUConfigParams(paymentType),
      );

       
    } catch (e, stack) {
      Logger().e("Error opening PayU Gateway: $e  $stack");
      CustomToast.show("Something went wrong while opening payment gateway");
    }
  }

  /// Payment Success
  @override
  void onPaymentSuccess(dynamic response) {
    Logger().d("Payment Success: $response");

    SessionManager().addPayUResponse(jsonEncode((jsonDecode(response["payuResponse"]))["result"]).toString());
    SessionManager().addTranscationResult(AppConstant.RESULT_OK);

    callRedirectMethods();
    // final args = Get.arguments ?? {};
    // final fromPage = args["fromPage"] ?? "";
    // if (fromPage == "billAndRecharg") {
    //   Get.offAllNamed(RoutesName.amountrechargescreen);
    // } else if (fromPage == "dth") {
    //   Get.offAllNamed(RoutesName.dthRechargeView);
    // } else {
    //   Get.offAllNamed(RoutesName.dashboard);
    // }

    CustomToast.show("Payment Success");
  }

  /// Payment Failure
  @override
  void onPaymentFailure(dynamic response) {
    Logger().e("Payment Failed: $response");
    SessionManager().addPayUResponse(jsonEncode(response["payuResponse"]));
    SessionManager().addTranscationResult(AppConstant.RESULT_CANCELED);
    CustomToast.show("Payment Failed");
    Get.back();
  }

  /// Payment Cancel
  @override
  void onPaymentCancel(Map? response) {
    Logger().w("Payment Cancelled: $response");
    SessionManager().addPayUResponse(jsonEncode(response));
    SessionManager().addTranscationResult(AppConstant.RESULT_CANCELED);
    CustomToast.show("Payment Cancelled");
    Get.toNamed(RoutesName.rechargeCancelScreen, arguments: null);
    
            
    
  }

  /// Payment Error
  @override
  void onError(Map? response) {
    Logger().e("Payment Error: $response");
    SessionManager().addPayUResponse(jsonEncode(response));
    SessionManager().addTranscationResult(AppConstant.RESULT_CANCELED);
    CustomToast.show("Payment mode is not enabled");
    Get.back();
  }

  /// --- HASH GENERATION ---
  @override
  generateHash(Map response) async {
    Logger().i("Generating hash for: $response");

    final hashResponse = await getGenerateHash(response);

    // return multiple hashes (like Java code)
    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  Future<Map> getGenerateHash(Map response) async {
    var hashName = response[PayUHashConstantsKeys.hashName];
    var hashStringWithoutSalt = response[PayUHashConstantsKeys.hashString];

    var hash = "";
    CommonApiRepo repoClass = CommonApiRepo();

    PayUStringHash requestModel = PayUStringHash(
      pipeStringValue: hashStringWithoutSalt.toString(),
      pipeStringValue1: '',
      pipeStringValue2: '',
      pipeStringValue3: '',
    );

    PayUHashResponse res = await repoClass.getPayuHash(
      requestModel,
      AuthToken.getAuthToken(),
      SessionManager().getToken().toString(),
    );

    if (res.status == "1") {
      hash = res.paymentHash ?? "";
    }

    return {hashName: hash};
  }

  void callRedirectMethods() {
    String serviceType = SessionManager().getServiceType()!;
    

    print("servicetypeeeeeeeeeee $serviceType");

    switch (serviceType) {
      case "Cable TV":
      case "Clubs and Associations":
      case "Donation":
      case "Education Fees":
      case "Electricity":
      case "Gas":
      case "Health Insurance":
      case "Hospital":
      case "Hospital and Pathology":
      case "Housing Society":
      case "Life Insurance":
      case "Loan Repayment":
      case "LPG Gas":
      case "Motor Insurance":
      case "Municipal Services":
      case "Municipal Taxes":
      case "National Pension System":
      case "Prepaid Meter":
      case "Recurring Deposit":
      case "Subscription":
        Get.toNamed(RoutesName.billerTableDetailsPage,
            arguments: {"fromPage": "FromBillPay"});
        break;
      case "PostPaid":
        Get.toNamed(RoutesName.postPaidTableDetailsPage,
            arguments: {"fromPage": "FromPostPay"});
        break;
      case "NCMC Recharge":
        Get.toNamed(RoutesName.fastagBillCardScreen,
            arguments: {"fromPage": "FromNCMCRecharge"});
      case "DTH Recharge":
        Get.toNamed(RoutesName.dthRechargeView,
            arguments: {"fromPage": "FromDTHRecharge"});
        break;
      case "Mobile Recharge":
        Get.toNamed(RoutesName.amountrechargescreen,
            arguments: {"fromPage": "FromMobileRecharge"});
             break;
      case "FastTag":
      case "fastTag":
        Get.toNamed(RoutesName.fastagBillCardScreen,
            arguments: {"fromPage": "FromFastTagRecharge"});
        break;
      default:
        Get.offAllNamed(RoutesName.dashboard);
        break;
    }
  }
}

class PayUParams {
  static const androidSurl =
      "https://antworksmoney.com/apiserver/antapp/success_payuresponse";
  static const androidFurl =
      "https://antworksmoney.com/apiserver/antapp/failure_payuresponse";

  /// Create Payment Params
  static Map createPayUPaymentParams(
      String amount, String pgKey, String paymentType) {
    return {
      PayUPaymentParamKey.key: pgKey,
      PayUPaymentParamKey.amount: amount,
      PayUPaymentParamKey.productInfo: "ProductInfo",
      PayUPaymentParamKey.firstName: SessionManager().getName(),
      PayUPaymentParamKey.email: SessionManager().getUserEmail(),
      PayUPaymentParamKey.phone: SessionManager().getMobile(),
      PayUPaymentParamKey.android_surl: androidSurl,
      PayUPaymentParamKey.android_furl: androidFurl,
      PayUPaymentParamKey.environment: "0", // 0 = Prod, 1 = Test
      PayUPaymentParamKey.userCredential: SessionManager().getMobile(),
      PayUPaymentParamKey.transactionId: SessionManager().getAntTxnId(),
      PayUPaymentParamKey.enableNativeOTP: true,
      PayUPaymentParamKey.userToken: "",
    };
  }

  // Create Checkout Config
  static Map createPayUConfigParams(String paymentType) {
   
   var enforceList = [];

  if (paymentType == "NB" ) {
    enforceList = [
      {"payment_type": paymentType}
    ];
  } else {
    enforceList = [
      {"payment_type": paymentType, "enforce_ibiboCode": "UTIBENCC"}
    ];
  }
    var payUCheckoutProConfig = {
      PayUCheckoutProConfigKeys.primaryColor: "#338DFF",
      PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
      PayUCheckoutProConfigKeys.merchantName: "Antpay",
      PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
      PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
      PayUCheckoutProConfigKeys.autoSelectOtp: true,
      PayUCheckoutProConfigKeys.autoApprove: false,
      PayUCheckoutProConfigKeys.merchantSMSPermission: true,
      PayUCheckoutProConfigKeys.showCbToolbar: true,
      PayUCheckoutProConfigKeys.enforcePaymentList:enforceList
      
    };
    return payUCheckoutProConfig;
  }
}
