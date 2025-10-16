import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/recharge_model/circle_list_model.dart';
import 'package:antpay_lite/model/recharge_model/operator_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/recharge_repository/mobilerecharge_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/common_utils.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_controller.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/recharge_model/recharge_payu_model.dart';
import '../../model/recharge_model/recharge_status_check.dart';
import '../../repository/billpay_repository/billpay_repo.dart';
// import 'package:antpay_lite/model/recharge_model/circle_list_model.dart';
// import 'package:antpay_lite/model/recharge/recharge_payment_payU_pojo.dart';
// import 'package:antpay_lite/model/recharge/recharge_razor_bean.dart';
// import 'package:antpay_lite/model/surge/social_after_payment_model.dart';
// import 'package:antpay_lite/utils/app_constant.dart';
// import 'package:antpay_lite/view/recharge_successful_view.dart';
// import 'package:antpay_lite/view/recharge_failed_view.dart';
// import 'package:antpay_lite/view/recharge_pending_view.dart';

class AmountMobileRechargeController extends GetxController
    with WidgetsBindingObserver {
  BillPayRepo repository = BillPayRepo();

  // final MobileRechargePlanController mobileRechargePlanController =
  //     Get.put<MobileRechargePlanController>(MobileRechargePlanController());

  final MobileRechargeController mobileController =
      Get.find<MobileRechargeController>();
  final loading = false.obs;
  final errorMessage = ''.obs;
  TextEditingController amountController = TextEditingController();
  final operator = ''.obs;
  final circle = ''.obs;
  final operatorName = <String>[].obs;
  final circleName = <String>[].obs;
  final operatorDataList = <Results>[].obs;
  final circleDataList = <Result>[].obs;
  final operatorCodeMap = <String, String>{}.obs;
  final circleCodeMap = <String, String>{}.obs;
  // final generateRechargeBean = Rx<RechargeRazorBean?>(null);
  int getTransactionStatusCount = 0;
  Map mobileCheckData = {};

  @override
  void onInit() {
    super.onInit();
    // amountController.text = mobileRechargePlanController.amount.value;
    SessionManager().addChannelType("PG");
    SessionManager().addFromScreen(RoutesName.amountrechargescreen);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getOperatorList();
      getCircleList();
      mobileCheckData = SessionManager().getMobileCheckResponse();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // if (SessionManager().getTranscationResult() == AppConstant.RESULT_OK) {
        if (Get.arguments != null) {
          if (Get.arguments['fromPage'] == "FromMobileRecharge") {
            Future.delayed(const Duration(seconds: 2), () {
              print("tttttttttttttttttttt ${getMobileNumber()}");

              print("tttttttttttttttttttt ${SessionManager().getMobile()}");
              callBillPaySucessApi();
            });
          }
        // }
      }
    }

    if (state == AppLifecycleState.inactive) print("inactive");
    if (state == AppLifecycleState.detached) print("detached");
    if (state == AppLifecycleState.paused) print("paused");
  }

  @override
  void onClose() {
    if (Get.isRegistered<AmountMobileRechargeController>()) {
      Get.delete<AmountMobileRechargeController>();
    }
    resetTopUpValues();
    WidgetsBinding.instance.removeObserver(this);
    amountController.dispose();
    super.onClose();
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void setErrorMessage(String value) {
    errorMessage.value = value;
  }

  void setOperator(String value) {
    operator.value = value;
  }

  void setCircle(String value) {
    circle.value = value;
  }

  // void setGenerateRechargeBean(RechargeRazorBean? value) {
  //   generateRechargeBean.value = value;
  // }

  void resetTopUpValues() {
    amountController.text = '';
    errorMessage.value = '';
    // generateRechargeBean.value = null;
  }

  Future<bool> validateTokens() async {
    String token = await SessionManager().getToken() ?? '';
    String authToken = AuthToken.getAuthToken() ?? '';
    if (token.isEmpty || authToken.isEmpty) {
      setErrorMessage(
          "Authentication tokens are missing. Please log in again.");
      CustomToast.show(errorMessage.value);
      Get.offAllNamed(RoutesName.login);
      return false;
    }
    return true;
  }

  Future<void> getOperatorList() async {
    setLoading(true);
    try {
      // Clear existing data
      operatorDataList.clear();
      operatorName.clear();
      operatorCodeMap.clear();

      final response = await MobileRechargeRepo().fetchOperator(
        await SessionManager().getToken() ?? '',
        AuthToken.getAuthToken() ?? '',
      );

      if (response != null && response.result != null) {
        // Populate lists and maps
        operatorDataList.value = response.result!;
        for (Results op in operatorDataList) {
          if (op.operator != null && op.operator_code != null) {
            operatorName.add(op.operator!);
            operatorCodeMap[op.operator!] = op.operator_code!;
          }
        }

        final mobileCheckData = SessionManager().getMobileCheckResponse();
        final companyName = (mobileCheckData['company_name'] ??
                mobileCheckData['company'] ??
                '')
            .toString()
            .toLowerCase();

        final matchingOperatorName = operatorName.firstWhere(
          (name) => name.toLowerCase().contains(companyName),
          orElse: () => '',
        );

        if (matchingOperatorName.isNotEmpty) {
          setOperator(matchingOperatorName);
          SessionManager().addOperator(matchingOperatorName);
          SessionManager()
              .addOperatorCode(operatorCodeMap[matchingOperatorName] ?? '');
        } else {
          setOperator('');
          SessionManager().addOperator('');
          SessionManager().addOperatorCode('');
          setErrorMessage(
              "Operator not found for ${mobileCheckData['company']}");
          CustomToast.show(errorMessage.value);
        }
      } else {
        setErrorMessage("Failed to load operators");
        CustomToast.show(errorMessage.value);
      }
    } catch (e) {
      setErrorMessage("Error loading operators: $e");
      CustomToast.show(errorMessage.value);
    } finally {
      setLoading(false);
    }
  }

  Future<void> getCircleList() async {
    setLoading(true);
    try {
      circleDataList.clear();
      circleName.clear();
      circleCodeMap.clear();
      final response = await MobileRechargeRepo().fetchCircle(
        await SessionManager().getToken() ?? '',
        AuthToken.getAuthToken() ?? '',
      );
      if (response != null && response.result != null) {
        circleDataList.value = response.result!;
        for (Result circle in circleDataList) {
          if (circle.circle != null && circle.circle_code != null) {
            circleCodeMap[circle.circle_code!] = circle.circle!;
            circleName.add(circle.circle!);
          }
        }
        final mobileCheckData = SessionManager().getMobileCheckResponse();
        String stateCode = mobileCheckData['state']?.toString() ?? '';
        circle.value = circleCodeMap[stateCode] ?? '';
        if (circle.value.isNotEmpty) {
          SessionManager().addValue(stateCode);
        } else {
          setErrorMessage("Circle not found for state code: $stateCode");
          CustomToast.show(errorMessage.value);
        }
      } else {
        setErrorMessage("Failed to load circles");
        CustomToast.show(errorMessage.value);
      }
    } catch (e) {
      setErrorMessage("Error loading circles: $e");
      CustomToast.show(errorMessage.value);
    } finally {
      setLoading(false);
    }
  }

  void setAmount(String value) {
    amountController.text = value;

    amountController.selection = TextSelection.fromPosition(
      TextPosition(offset: amountController.text.length),
    );
  }

  Future<void> callBillPaySucessApi() async {
    loading.value = true;
    try {
      Map orderdata = SessionManager().getGenerateOrderResponse();
      RechargePayUPaymentReq data = RechargePayUPaymentReq(
          //paymentMethod: orderdata[SessionManager.SERVICE],
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          antTxnId: orderdata[SessionManager.AMOUNT_TRANSCATION_ID],
          circlecode: SessionManager().getValue(),
          operatorcode: SessionManager().getOperatorCode(),
          amount: orderdata[SessionManager.INVESTMENT_AMOUNT],
          servicetype: orderdata[SessionManager.SERVICE],
          transactionType: "Spend",
          paymentMethod: orderdata[SessionManager.PGTYPE],
          number: SessionManager().getMobile(),
          customermobile: getMobileNumber(),
          transactionResult: SessionManager().getTranscationResult(),
          payuResponse: SessionManager().getPayUResponse().toString());

      RechargePayUPaymentRes response =
          await repository.callPaymentSuccessRechargePay(
              AuthToken.getAuthToken(),
              SessionManager().getToken().toString(),
              data);

      if (response.status.toString() == '1') {
        Get.toNamed(RoutesName.rechargeSuccess, arguments: null);
      } else  {
        // CustomToast.show(response.responseMessage ?? "");

        callCheckRechargeStatusApi();
      }
    } catch (e) {
      Get.toNamed(RoutesName.rechargeFail, arguments: null);
      CustomToast.show(e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> callCheckRechargeStatusApi() async {
    loading.value = true;
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
        Get.toNamed(RoutesName.rechargeSuccess, arguments: null);
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
      } else {
         getTransactionStatusCount = 0;
        CustomToast.show(response.responseMessage ?? "");
        Get.toNamed(RoutesName.rechargeFail, arguments: null);
      }
    } catch (e) {
       getTransactionStatusCount = 0;
      CustomToast.show(e.toString());
       Get.toNamed(RoutesName.rechargeFail, arguments: null);
    } finally {
      loading.value = false;
    }
  }

  String getMobileNumber() {
    return mobileCheckData['mobile']?.toString() ??
        mobileController.mobileCheckResponse.value?.number ??
        mobileController.mobileNumberController.text;
  }

  String getCompanyName() {
    return mobileCheckData['company']?.toString().toUpperCase() ??
        mobileController.mobileCheckResponse.value?.company?.toUpperCase() ??
        '';
  }
}
