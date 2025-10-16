import 'dart:async';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/miniAcc/mini_acc_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../prefrences/session_manager.dart';
import 'package:antpay_lite/model/otp_model/comman_send_otp_bean.dart';

class MiniAccountPhoneController extends GetxController {
  TextEditingController mobileController = TextEditingController();
RxBool isLoading = false.obs;
  var remainingSeconds = 60.obs;
  var timeDisplay = "60 Secs".obs;
  Color textColor = Colors.blueAccent;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    mobileController.text = SessionManager().getMobile()!;
  }

  sendOtp() async {
      isLoading.value = true;
    try {
      CommonSendOtpRequestModel request = CommonSendOtpRequestModel(
    mobile:  SessionManager().getMobile().toString(),
    service: "PPI_Mobile_Send_Otp",
    aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
  );
      CommonSendOtpResponseModel response =
          await CommonApiRepo().apiClient.commanUserSendOtp(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
     request
      );

      if (response.status == 1) {
        Get.to(()=>MiniAccOtpPage(service: "PPI_Mobile_Send_Otp"));
      } else {
        CustomToast.show(response.msg ?? "Something went wrong");
      }
    } catch (e) {
      CustomToast.show("Error sending OTP");
    }finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    mobileController.dispose();
    if (Get.isRegistered<MiniAccountPhoneController>()) {
      Get.delete<MiniAccountPhoneController>();
    }
    super.onClose();
  }
}
