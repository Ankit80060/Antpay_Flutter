import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/views/p2p_lending/PaymentProcessingmodel.dart';
import 'package:antpay_lite/views/p2p_lending/investment_succesfully_failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpaySingleton {
  static final RazorpaySingleton _instance = RazorpaySingleton._internal();
  factory RazorpaySingleton() => _instance;

  late Razorpay _razorpay;

  RazorpaySingleton._internal() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void makePayment(
    String apiKey,
    String orderId,
    String amount,
    BuildContext context,
    String serviceType,
  ) {
    try {
      var options = {
        'key': apiKey,
        'amount': int.parse(amount),
        'order_id': orderId,
        'name': 'AntPay',
        'description': 'Investment via $serviceType',
        'timeout': 120,
        'prefill': {
          'contact': SessionManager().getMobile().toString(),
          'email': SessionManager().getUserEmail() ?? 'test@example.com',
        },
        'theme': {
          'color': '#FF0000',
        },
      };

      _razorpay.open(options);
    } catch (e) {
      CustomToast.show("'Payment Error Something went wrong with Razorpay");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    CustomToast.show("Success, Payment completed: ${response.paymentId}");
    CommonApiRepo repoClass = CommonApiRepo();
    Map orderdata = SessionManager().getGenerateOrderResponse();
    PaymentProcessingRequest paymentRequest = PaymentProcessingRequest(
      mobile: SessionManager().getMobile(),
      antTxnId: orderdata['amount_transcation_id'].toString(),
      investmentAmount: orderdata['investment_amount'].toString(),
      totalAmount: orderdata['payable_amount'].toString(),
      schemeId: SessionManager().getSchemeId().toString(),
      razorpayOrderId: response.orderId,
      razorpayPaymentId: response.paymentId,
      razorpaySignature: response.signature,
    );
    PaymentProcessingResponse paymentResponse =
        await repoClass.lenSocialApiClient.sendPaymentProcessingDetails(
      "TVRJek5EVT0=",
      AuthToken.getAuthToken(),
      SessionManager().getToken().toString(),
      paymentRequest,
    );
    Future.delayed(Duration.zero, () {
      if (paymentResponse.status == '1') {
        Get.off(() => const InvestmentPaymnetSuccesfullyFailedScreen(),
            arguments: {
              "success": true,
              "message": "Payment completed successfully",
              "paymentId": response.paymentId,
            });
      } else {
        Get.off(() => const InvestmentPaymnetSuccesfullyFailedScreen(),
            arguments: {
              "success": false,
              "message": "Payment Failed",
              "paymentId": response.paymentId,
            });
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.to(() => const InvestmentPaymnetSuccesfullyFailedScreen(), arguments: {
      "success": false,
      "message": response.message,
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    CustomToast.show("External Wallet ${response.walletName}");
  }

  void clear() {
    _razorpay.clear();
  }
}
