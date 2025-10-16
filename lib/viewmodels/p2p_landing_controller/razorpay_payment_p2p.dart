// import 'package:antpay_lite/prefrences/session_manager.dart';
// import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_amount_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import '../../res/color_palette.dart';
// import '../../utils/common_utils.dart';
// import '../../utils/routes/routes_name.dart';

// class RazorpaySingleton {
//   static final RazorpaySingleton _instance = RazorpaySingleton._internal();

//   final InvestmentAmountController controller = Get.find();

//   factory RazorpaySingleton() => _instance;

//   Razorpay? _razorpay;
//   BuildContext? _context;
//   BuildContext? _dialogContext;

//   Function(PaymentSuccessResponse, String)? onSuccessCallback;
//   Function(PaymentFailureResponse, String)? onErrorCallback;

//   RazorpaySingleton._internal() {
//     _razorpay = Razorpay();
//     _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   void makePayment({
//     required String apiKey,
//     required String orderId,
//     required String amount,
//     required BuildContext context,
//     required String service,
//   }) {
//     _context = context;
//     controller.currentService = service;

//     final options = {
//       'key': apiKey,
//       'amount': amount,
//       'name': 'AntWorks Money',
//       'order_id': orderId,
//       'description': 'Product Info',
//       'timeout': 180,
//       'prefill': {
//         'contact': SessionManager().getMobile().toString(),
//         'email': SessionManager().getMailId().toString(),
//       }
//     };

//     try {
//       _razorpay?.open(options);
//     } catch (e) {
//       CommonUtils.showToast('Error in payment: ${e.toString()}');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     print('✅ Payment Success');
//     SessionManager().addPaymentSuccessDetails(
//       response.orderId.toString(),
//       response.paymentId.toString(),
//       response.signature.toString(),
//     );

//     if (onSuccessCallback != null) {
//       onSuccessCallback!(response, controller.currentService);
//     } else {
//       await _getAfterPayment(response);
//     }
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print('❌ Payment Failed: ${response.message}');
//     if (_context != null) {
//       Navigator.pushNamed(_context!, RoutesName.investment_fail);
//     }
//     CommonUtils.showToast('Payment Failed!');
//     onErrorCallback?.call(response, controller.currentService);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print("⚠️ External Wallet Selected: ${response.walletName}");
//   }

//   Future<void> _getAfterPayment(PaymentSuccessResponse response) async {
//     final orderData = SessionManager().getGenerateOrderResponse();
//     await _showProcessingDialog();

//     final data = SocialAfterPaymentRequestModel(
//       ant_txn_id: orderData['amount_transcation_id'].toString(),
//       mobile: SessionManager().getMobile().toString(),
//       amount: orderData['investment_amount'].toString(),
//       payment_method: "PG",
//       service: "social-lending",
//       razorpay_order_id: response.orderId.toString(),
//       razorpay_payment_id: response.paymentId.toString(),
//       razorpay_signature: response.signature.toString(),
//       source: StringConstant.source,
//     );

//     final responseModel = await controller.getAfterPayment(data);

//     if (responseModel.status == "1") {
//       await _sendPaymentStatus();
//     } else {
//       _dismissDialog();
//       Navigator.pushNamed(_context!, RoutesName.investment_fail);
//     }
//   }

//   Future<void> _sendPaymentStatus() async {
//     final orderData = SessionManager().getGenerateOrderResponse();

//     final data = LenderInvestmentRequestModel(
//       scheme_id: SessionManager().getSchemeID().toString(),
//       lender_id: SessionManager().getLenderId().toString(),
//       amount: orderData['investment_amount'].toString(),
//       phone: SessionManager().getMobile(),
//       ant_txn_id: orderData['amount_transcation_id'].toString(),
//       source: StringConstant.source,
//     );

//     final response = await controller.sendPaymentStatus(data);

//     _dismissDialog();

//     if (response.status == "1") {
//       SessionManager().addInvestmentNumber(response.investment_no.toString());
//       Navigator.pushNamed(_context!, RoutesName.investment_success);
//     } else {
//       CommonUtils.showToast(response.msg.toString());
//     }
//   }

//   Future<void> _showProcessingDialog() async {
//     if (_context == null) return;

//     await showDialog(
//       context: _context!,
//       barrierDismissible: false,
//       builder: (context) {
//         _dialogContext = context;
//         return AlertDialog(
//           title: const Text('Please Wait'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Text(
//                 'We are processing your investment. Please do not close this screen.',
//               ),
//               SizedBox(height: 16),
//               CircularProgressIndicator(color: ColorPalette.nextButtonColor),
//             ],
//           ),
//           backgroundColor: Colors.white,
//         );
//       },
//     );
//   }

//   void _dismissDialog() {
//     if (_dialogContext != null) {
//       Navigator.pop(_dialogContext!);
//     } else {
//       print('⚠️ Dialog context is null, cannot dismiss');
//     }
//   }
// }
