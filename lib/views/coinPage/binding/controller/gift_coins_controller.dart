import 'dart:async';

import 'package:antpay_lite/views/coinPage/binding/controller/coin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/auth_token.dart';
import '../../../../custom_widget/custom_toast_msg.dart';
import '../../../../prefrences/session_manager.dart';
import '../../../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../../../utils/app_constant.dart';

class GiftCoinsPageController extends GetxController {
  final coinPageController = Get.find<CoinPageController>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController coinsController = TextEditingController();

  final TextEditingController otpController = TextEditingController();
  RxBool isLoading = false.obs;
  MiniAccountRepo repository = MiniAccountRepo();

  RxString useMobileNumber = ''.obs;
  RxBool isSubmitedGiftCoins = false.obs;

  RxBool showResendText = false.obs;
  
  RxInt secondsLeft = 0.obs ;
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (SessionManager().getMobile() != null) {
      useMobileNumber.value = SessionManager().getMobile().toString();
    }
  }
  
  void startTimer() {
      secondsLeft.value = 30;
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

  bool validateInputs(String mobile, String coins) {
    if (mobile.isEmpty) {
      CustomToast.show("Please enter mobile number");
      return false;
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
      CustomToast.show("Enter a valid 10-digit mobile number");
      return false;
    }

    if (coins.isEmpty) {
      CustomToast.show("Please enter coins");
      return false;
    }

    final coinValue = int.tryParse(coins);
    if (coinValue == null) {
      CustomToast.show("Coins must be a number");
      return false;
    }

    if (coinValue <= 0) {
      CustomToast.show("Coins must be greater than 0");
      return false;
    }

    return true; 
  }

  void clickSubmitBtn() async {
    final mobile = mobileController.text.trim();
    final coins = coinsController.text.trim();

    if (!validateInputs(mobile, coins)) {
      return;
    }

    try {
      isLoading.value = true;
      var data = {
        "mobile": SessionManager().getMobile().toString(),
        "source": "Antpay",
        "f_mobile": mobileController.text,
        "point": coinsController.text,
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      };

      final response = await repository.callRewardcoinsOtp(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request: data,
      );
      if (response.status.toString() == '1') {
        isSubmitedGiftCoins.value = true;
        startTimer();
      } else {
        //  isSubmitedGiftCoins.value = true;
        // startTimer();
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clickVerifyOtpBtn() async {
    final mobile = mobileController.text.trim();
    final coins = coinsController.text.trim();
    if (otpController.text.trim().isEmpty) {
      CustomToast.show("Please enter OTP");
      return;
      
    }else if (otpController.text.trim().length < 6) {
      CustomToast.show("OTP must be 6 digits");
      return;
    }

    if (!validateInputs(mobile, coins)) {
      return;
    }

    try {
      isLoading.value = true;
      var data = {
        "mobile": SessionManager().getMobile().toString(),
        "source": "Antpay",
        "f_mobile": mobileController.text,
        "point": coinsController.text,
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        "otp": otpController.text.trim(),
      };

      final response = await repository.callVerifyOtpApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request: data,
      );
      if (response.status.toString() == '1') {
        // isVerifyOtpSuccess.value = true;
        CustomToast.show(response.msg.toString());
        coinPageController.closeClaimCouponPage();
      } else {
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<GiftCoinsPageController>()) {
      Get.delete<GiftCoinsPageController>();
    }
    isSubmitedGiftCoins.value = false;
    mobileController.dispose();
    coinsController.dispose();
    otpController.dispose();
    timer.cancel();
    isLoading.value = false;
    showResendText.value = false;
    secondsLeft.value = 0;

  }
}
}