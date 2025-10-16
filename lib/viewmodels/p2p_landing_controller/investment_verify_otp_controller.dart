import 'dart:async';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/otp_model/comman_otpVerify_model.dart';
import 'package:antpay_lite/model/otp_model/comman_send_otp_bean.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/views/p2p_lending/investment_invoice_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../prefrences/session_manager.dart';

class InvestmentOTPVerifyController extends GetxController {
  TextEditingController otpController = TextEditingController();
  RxString useMobileNumber = ''.obs;
  RxBool isLoading = false.obs;
  var remainingSeconds = 120.obs;
  var timeDisplay = "2 Min 0 Secs".obs;
  Color textColor = Colors.blueAccent;
  Timer? _timer;

  Map<String, dynamic>? data;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    useMobileNumber.value = SessionManager().getMobile()!;
    data = Get.arguments;
    startTimer();
  }

  void startTimer() {
    remainingSeconds.value = 120;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        timeDisplay.value = remainingSeconds.value > 59
            ? "1 Min ${remainingSeconds.value % 60} Secs"
            : "${remainingSeconds.value} Secs";
        textColor = Colors.blueAccent;
      } else {
        timeDisplay.value = "Time Ended !!";
        textColor = Colors.grey;
        _timer?.cancel();
      }
    });
  }

  commanverifyOtp(
    String mobile,
  ) async {
    isLoading.value = true;
    try {
      String otp = otpController.value.text;

      CommanUserOtpVerifyRequestModel request = CommanUserOtpVerifyRequestModel(
        mobile: SessionManager().getMobile().toString(),
        service: "PPI_Mobile_Send_Otp",
        otp: otp,
      );

      String number = SessionManager().getMobile().toString();

      CommanUserOtpVerifyResponseModel response =
          await CommonApiRepo().apiClient.commanUserOtpVerify(
                AuthToken.getAuthToken(),
                SessionManager().getToken().toString(),
                request,
              );

      if (response.status.toString() == "1") {
        Get.off(() => InvestmentInvoiceDetailScreen());
        CustomToast.show(response.msg ?? '');
      } else {
        CustomToast.show("Invalid response received");
      }
    } catch (e, stackTrace) {
      CustomToast.show("Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  sendOtp() async {
    isLoading.value = true;
    try {
      CommonSendOtpRequestModel request = CommonSendOtpRequestModel(
        mobile: SessionManager().getMobile().toString(),
        service: "PPI_Mobile_Send_Otp",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      );
      CommonSendOtpResponseModel response = await CommonApiRepo()
          .apiClient
          .commanUserSendOtp(SessionManager().getToken().toString(),
              AuthToken.getAuthToken(), request);

      if (response.status == 1) {
        startTimer();
      } else {
        CustomToast.show(response.msg ?? "Something went wrong");
      }
    } catch (e) {
      CustomToast.show("Error sending OTP");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _timer?.cancel();
    if (Get.isRegistered<InvestmentOTPVerifyController>()) {
      Get.delete<InvestmentOTPVerifyController>();
    }
  }
}
