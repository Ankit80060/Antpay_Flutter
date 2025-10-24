import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/recharge_model/circle_list_model.dart';
import 'package:antpay_lite/model/recharge_model/operator_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_controller.dart';
import 'package:antpay_lite/viewmodels/recharge/recharge_common_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth_token.dart';
import '../../../model/recharge_model/recharge_payu_model.dart';
import '../../../model/recharge_model/recharge_status_check.dart';
import '../../../repository/billpay_repository/billpay_repo.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/routes/routes_name.dart';
// import 'package:get/get.dart';
// import '../../../model/recharge/circle_list_model.dart';
// import '../../../model/recharge/operator_list_model.dart';
// import '../../../model/recharge/recharge_payment_payU_pojo.dart';
// import '../../../preferences/session_manager.dart';
// import '../../../utils/common_utils.dart';
// import '../../../app_constants.dart';
// import '../recharge_failed_view.dart';
// import '../recharge_successful_view.dart';
// import '../../../ViewModel/recharge/recharges_view_model.dart';

class DthRechargeController extends GetxController with WidgetsBindingObserver {
    BillPayRepo repository = BillPayRepo();
  final MobileRechargeController mobileRechargeController =
      Get.find<MobileRechargeController>();
  final RechargeCommonController commonController =
      Get.find<RechargeCommonController>();

  final dthController = TextEditingController().obs;
  final amountController = TextEditingController();
  final circleName = <String>[].obs;
  final operatorName = <String>[].obs;
  final selectedCircle = ''.obs;
  final selectedOperator = ''.obs;
  final circleDataList = <Result>[].obs;
  final operatorDataList = <Results>[].obs;
  final operatorList = <Results>[].obs;
  var circle = ''.obs;
  final operator = ''.obs;

  get isLoading => null;

  int getTransactionStatusCount=0;

  // final rechargeViewModel = Get.find<RechargeViewModel>();
  // var generateRechargeBean = Rxn<RechargePayUPaymentPOJO>();

  @override
  void onInit() {
    super.onInit();
   

    WidgetsBinding.instance.addObserver(this);
    SessionManager().addChannelType("PG");
    getCircleList();
    getOperatorList();
  }



   @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {

      if (SessionManager().getTranscationResult() == AppConstant.RESULT_OK) {
    if (Get.arguments != null) {

      if (Get.arguments['fromPage'] == "FromDTHRecharge") {
        Future.delayed(const Duration(seconds: 2), () {
          callBillPaySucessApi();
        });
      }
    }
      }
    }

    if (state == AppLifecycleState.inactive) print("inactive");
    if (state == AppLifecycleState.detached) print("detached");
    if (state == AppLifecycleState.paused) print("paused");
  }

  @override
  void onClose() {
    commonController.setAmount("");
    dthController.value.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  

  void getCircleList() async {
    circleDataList.clear();
    final circles = await mobileRechargeController.fetchCircle();

    if (circles != null) {
      circleDataList.addAll(circles);
      circleName.assignAll(circles.map((e) => e.circle!).toList());
    }
  }

  void getOperatorList() async {
    operatorDataList.clear();
    final operators = await mobileRechargeController.fetchOperatordth();
    if (operators != null) {
      operatorDataList.addAll(operators);
      operatorName.assignAll(operators.map((e) => e.operator ?? '').toList());
      // operatorName.refresh(); // Ensure dropdown updates
    } else {
      CustomToast.show("Failed to load operators");
    }
  }



  bool validateInputs() {
    if (circle.isEmpty || circle.value == "All circles") {
      CustomToast.show("Please select a Circle");
      return false;
    }
    if (operator.isEmpty) {
      CustomToast.show("Please select an Operator");
      return false;
    }
    if (dthController.value.text.isEmpty) {
      CustomToast.show("Please enter a DTH Number");
      return false;
    }
    if (dthController.value.text.length < 10 ||
        dthController.value.text.length > 12) {
      CustomToast.show("DTH Number must be 10-12 digits");
      return false;
    }

    return true;
  }
  
  Future<void> callBillPaySucessApi() async {
    showLoaderPopup(Get.context!);
    isLoading.value = true;
    try {
      Map orderdata = SessionManager().getGenerateOrderResponse();
      RechargePayUPaymentReq data = RechargePayUPaymentReq(
          //paymentMethod: orderdata[SessionManager.SERVICE],
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          antTxnId: SessionManager().getAntTxnId(),
          circlecode: SessionManager().getValue(),
          operatorcode: SessionManager().getOperatorCode(),
          number: SessionManager().getMobile(),
          amount: orderdata[SessionManager.INVESTMENT_AMOUNT],
          servicetype: orderdata[SessionManager.SERVICE],
          transactionType: "Spend",
          paymentMethod: orderdata[SessionManager.PGTYPE],
          customermobile: SessionManager().getmobNumber(),
          transactionResult: SessionManager().getTranscationResult(),
          payuResponse: SessionManager().getPayUResponse().toString());


      RechargePayUPaymentRes response =
          await repository.callPaymentSuccessRechargePay(
              AuthToken.getAuthToken(),
              SessionManager().getToken().toString(),
              data);

      if (response.status.toString() == '1') {
        Get.toNamed(RoutesName.rechargeSuccess,arguments: null);
        //sent to success screen
      } else {
        callCheckRechargeStatusApi();
        
      }
    } catch (e) {
      Get.toNamed(RoutesName.rechargeFail, arguments: null);
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> callCheckRechargeStatusApi() async {
    isLoading.value = true;
    try {
      Map orderdata = SessionManager().getGenerateOrderResponse();
      RechargeStatusReq data = RechargeStatusReq(
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        // mobile: SessionManager().getMobile(),
        utransactionid: orderdata[SessionManager.AMOUNT_TRANSCATION_ID],
      );
      RechargeStatusRes response = await repository.callCheckRechargeStatusApi(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),
          data);

      if (response.status.toString() == '1') {
        Get.toNamed(RoutesName.rechargeSuccess,arguments: null);
      } else if (response.status.toString() == "0" ||
          response.status.toString() == "2") {
        if (getTransactionStatusCount < 10) {
          getTransactionStatusCount++;
          Future.delayed(const Duration(seconds: 2), () {
            callCheckRechargeStatusApi();
          });
        } else {
          getTransactionStatusCount = 0;
      CustomToast.show(response.responseMessage ?? "");
          Get.toNamed(RoutesName.pendingOrderScreen, arguments: null);
        }
      }  else {
         getTransactionStatusCount = 0;
        CustomToast.show(response.responseMessage ?? "");
        Get.toNamed(RoutesName.rechargeFail, arguments: null);
      }
     
    } catch (e) {
      Get.toNamed(RoutesName.rechargeFail, arguments: null);
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


 void showLoaderPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
      // Timer(const Duration(seconds: 10), () {
      //   if (Navigator.of(context).canPop()) {
      //     Navigator.of(context).pop();
      //   }
      // });

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/loader_image.gif',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                'Please wait...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    },
  );
}
 
}
