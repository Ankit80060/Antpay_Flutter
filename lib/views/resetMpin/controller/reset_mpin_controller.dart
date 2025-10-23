import 'dart:async';

import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../model/Mpin/SetMpinModel.dart';
import '../../../prefrences/session_manager.dart';
import '../../../repository/login_repository/miniAccountRepo/wallet_setting_repo.dart';
import '../../../utils/app_constant.dart';

class ResetMpinController extends GetxController {
  WalletSettingRepo wallet_repository = WalletSettingRepo();

  final TextEditingController otpController = TextEditingController();
  final TextEditingController oldMpinController = TextEditingController();
  final TextEditingController newMpinController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString actionStatus = ''.obs;

  RxInt secondsLeft = 0.obs;
  late Timer timer;
  RxBool showResendText = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (!SessionManager().getPayUMpinStatus()) {
 
      actionStatus.value = "SET";
    } else {
      actionStatus.value = "RESET";
    }
    sendOtpStatusBase();
  }

  void startTimer() {
    secondsLeft.value = 120;
    showResendText.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft > 0) {
        secondsLeft--;
      } else {
        t.cancel();
        showResendText.value = true;
      }
    });
  }

void sendOtpStatusBase() async {
  try {
    isLoading.value = true;

    final mobile = SessionManager().getMobile().toString();
    final token = SessionManager().getToken().toString();
    final authToken = AuthToken.getAuthToken();

    final data = {
      "customerMobile": mobile,
      "aParam": AppConstant.generateAuthParam(mobile),
      "action": actionStatus.value,
    };

    var response = await wallet_repository.callWalletSendOtpApi(
      token,
      authToken,
      request: data,
    );


    if (response.responseCode.toString().trim() == '00') {
      startTimer();
      //  CustomToast.show(response.responseMessage.toString());
    }
  } catch (e, s) {
    CustomToast.show("Something went wrong!");
    debugPrint("sendOtpStatusBase error: $e");
    debugPrint("Stack trace: $s");
  } finally {
    isLoading.value = false;
  }
}


  void callMpinSetResetApi() async {
    try {
      isLoading.value = true;
      SetMPinRequest data = SetMPinRequest(
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          customerMobile: SessionManager().getMobile().toString(),
          newMpin: newMpinController.text.trim(),
          oldMPin: oldMpinController.text.trim(),
          otp: otpController.text.trim(),
          action: actionStatus.value,
          deviceId: SessionManager().getDeviceId().toString());

      final response = await wallet_repository.callWalletSetResetMPinApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request: data,
      );
      SessionManager().addPayUUserToken(response.token);
      if (response.responseCode.toString() == '00') {
        SessionManager().addPayUMpinStatus(true);
        SessionManager().addPayUUserToken(response.token);
        CustomToast.show(response.responseMessage.toString());
        Get.offNamed(RoutesName.dashboard);
      } else {
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<ResetMpinController>()) {
      Get.delete<ResetMpinController>();
    }
    otpController.dispose();
    oldMpinController.dispose();
    newMpinController.dispose();
    timer.cancel();
  }

  bool validateMpin(String value) {
    final otp = otpController.text.trim();
    final oldPin = oldMpinController.text.trim();
    final newPin = newMpinController.text.trim();

    // OTP validation (applies for all cases)
    if (otp.isEmpty) {
      CustomToast.show("Please enter OTP");
      return false;
    } else if (otp.length != 6) {
      CustomToast.show("Please enter valid 6-digit OTP");
      return false;
    }

    // Handle SET case (oldPin = newPin, newPin = confirmPin)
    if (value == "SET") {
      if (oldPin.isEmpty) {
        CustomToast.show("Please enter new MPIN");
        return false;
      } else if (oldPin.length < 6) {
        CustomToast.show("Please enter valid new MPIN");
        return false;
      } else if (newPin.isEmpty) {
        CustomToast.show("Please confirm new MPIN");
        return false;
      } else if (newPin.length < 6) {
        CustomToast.show("Please enter valid confirm MPIN");
        return false;
      } else if (oldPin != newPin) {
        CustomToast.show("New MPIN and Confirm MPIN do not match");
        return false;
      }
    }

    // Handle RESET case (oldPin = oldPin, newPin = newPin)
    else if (value == "RESET") {
      if (oldPin.isEmpty) {
        CustomToast.show("Please enter old MPIN");
        return false;
      } else if (oldPin.length < 6) {
        CustomToast.show("Please enter valid old MPIN");
        return false;
      } else if (newPin.isEmpty) {
        CustomToast.show("Please enter new MPIN");
        return false;
      } else if (newPin.length < 6) {
        CustomToast.show("Please enter valid new MPIN");
        return false;
      }
    }

    // Handle FORGOT case (oldPin = newPin, newPin = confirmPin)
    else if (value == "FORGOT") {
      if (oldPin.isEmpty) {
        CustomToast.show("Please create new MPIN");
        return false;
      } else if (oldPin.length < 6) {
        CustomToast.show("Please enter valid new MPIN");
        return false;
      } else if (newPin.isEmpty) {
        CustomToast.show("Please confirm MPIN");
        return false;
      } else if (oldPin != newPin) {
        CustomToast.show("New MPIN and Confirm MPIN do not match");
        return false;
      }
    }

    return true;
  }

  void clickMpinButton(String value) {
    if (validateMpin(value)) {
      callMpinSetResetApi();
    }
  }

  void clickForgotMpin() {
    if (actionStatus.value == "FORGOT") {
      actionStatus.value = "RESET";
      oldMpinController.clear();
      newMpinController.clear();
      
    } else {
      actionStatus.value = "FORGOT";
      oldMpinController.clear();
      newMpinController.clear();
      otpController.clear();
      sendOtpStatusBase();
    }
    // sendOtpStatusBase();
  }
}
