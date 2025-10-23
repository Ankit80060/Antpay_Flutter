import 'dart:convert';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/payment/customer_load_balance.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_utils.dart';

class CustomDashboardController extends GetxController
    with WidgetsBindingObserver {
  DateTime? lastBackPressed;
  willPopFunction() {
    if (selectedIndex.value != 0) {
      onTapped(0);
      return false;
    } else {
      DateTime now = DateTime.now();
      if (lastBackPressed == null ||
          now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
        lastBackPressed = now;
        CustomToast.show(
          'Press back again to exit',
        );
        return false;
      }
      return true;
    }
  }

  var selectedIndex = 0.obs;
  late PageController pageController;

  CustomerLoadbalanceResponse? customerLoadbalanceResponse;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    int initialIndex = 0;
    final args = Get.arguments;
    if (args != null && args is Map && args.containsKey('bottomNavIndex')) {
      final argIndex = args['bottomNavIndex'];
      if (argIndex is int && argIndex >= 0 && argIndex <= 3) {
        initialIndex = argIndex;
      }
    }
    selectedIndex.value = initialIndex;
    pageController = PageController(initialPage: initialIndex);
    WidgetsBinding.instance.addObserver(this);
  }

  void onTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }



// callAddMoneyApi() async {
//   try {
//     isLoading.value = true;

//     CommonApiRepo repoClass = CommonApiRepo();
//     Map orderdata = SessionManager().getGenerateOrderResponse();

//   String? customerId = await SessionManager().getCustomerId();
// if (customerId == null || customerId.isEmpty) {
//   CustomToast.show("Customer ID is missing. Please log in again.");
//   isLoading.value = false;
//   return;
// }


//     final data = CustomerLoadbalanceRequest(
//       accountNumber: SessionManager().getReterieveaccountNumber().toString(),
//       customerId: customerId,
//       clientTxnId: "",
//       originalClientTxnId: "",
//       implType: "PG_TU_I",
//       refundFileId: "sreekumar.csv",
//       implId: "I|70190",
//       messageCode: "",
//       transactionAmount: ((double.tryParse(
//                   orderdata[SessionManager.INVESTMENT_AMOUNT]?.toString() ??
//                       '0') ??
//               0) *
//           100)
//           .toInt(),
//       sourceType: 0,
//       sender: "PayU PG",
//       sourceAccount: "27389282",
//       requestDateTime: "",
//       loadCurrency: "INR",
//       fundFlowType: "I",
//       fee: 0,
//       antTxnId: SessionManager().getAntTxnId(),
//       mobile: SessionManager().getMobile(),
//       remark: "remark",
//       paymentMethod: "PG",
//       payuResponse: SessionManager().getPayUResponse(),
//       transactionResult: SessionManager().getTranscationResult(),
//       transactionType: "Load",
//       pgNo: SessionManager().getAntTxnId(),
//       aParam:
//           AppConstant.generateAuthParam(SessionManager().getMobile().toString()),
//       tagName: "ppi-wallet_payment",
//     );

//     var response = await repoClass.apiClient.customerloadaccount(
//       AuthToken.getAuthToken(),
//       SessionManager().getToken().toString(),
//       data,
//     );
//     final Map<String, dynamic> decodedResponse =
//         response is String ? jsonDecode(response) : response;

//     print("Decoded Response: $decodedResponse");

//     if (decodedResponse['status'] == 1 ||
//         decodedResponse['responseCode'] == '00') {
//       customerLoadbalanceResponse = decodedResponse as CustomerLoadbalanceResponse?;
//       CustomToast.show(decodedResponse['msg'] ?? "Load Money Successful");
//     } else {
//       CustomToast.show(decodedResponse['msg']);
//     }
//   } catch (e) {
//     print("Error: $e");

//   } finally {
//     isLoading.value = false;
//   }
// }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (state == AppLifecycleState.resumed) {
//       if (SessionManager().getTranscationResult() == AppConstant.RESULT_OK) {
//         await callAddMoneyApi();
//       }
//     }

//     if (state == AppLifecycleState.inactive) print("inactive");
//     if (state == AppLifecycleState.detached) print("detached");
//     if (state == AppLifecycleState.paused) print("paused");
//   }

  @override
  void onClose() {
    pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
