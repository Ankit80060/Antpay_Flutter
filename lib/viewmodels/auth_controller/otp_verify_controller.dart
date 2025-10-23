import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:antpay_lite/api/otp_api_repo.dart';
import 'package:antpay_lite/api/otp_repository.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/auth_model/login_model.dart';
import 'package:antpay_lite/model/auth_model/user_model.dart';
import 'package:antpay_lite/model/device_model/device_information.dart';
import 'package:antpay_lite/model/device_model/info_model.dart';
import 'package:antpay_lite/model/otp_model/otp_model.dart';
import 'package:antpay_lite/model/otp_model/otp_user_model.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:telephony_fix/telephony.dart';
import '../../prefrences/session_manager.dart';

class OTPVerifyController extends GetxController {
  final _otpRepo = OtpRepository();
  final remainingTime = 180.obs;
  final showTime = ''.obs;
  final canResend = false.obs;
  final loading = false.obs;
  RxString firebaseToken = ''.obs;
  final TextEditingController pincontroller = TextEditingController();
  late final deviceInfoSingleton;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final loginDetail = LoginModel();
  final DeviceInfoModel deviceInfoModel = DeviceInfoModel();

  late Map userData;
  late UserModel userResponse;
  Timer? _timer;
  String? fcmToken;

  final Telephony _telephony = Telephony.instance;

  void _initFirebaseToken() async {
    String? token = await _firebaseMessaging.getToken();

    if (token != null) {
      firebaseToken.value = token;
      ("Firebase Token: $token");
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      firebaseToken.value = newToken;
    });
  }

//lifecycle
  @override
  void onInit() {
    super.onInit();
    startTimer(180);

    _initFirebaseToken();
    deviceInfoSingleton = DeviceInfoSingleton();
    _listenIncomingSms();
  }

  @override
  void onClose() {
    _timer?.cancel();
    if (Get.isRegistered<OTPVerifyController>()) {
      Get.delete<OTPVerifyController>();
    }
    super.onClose();
  }

  // Timer Functions
  startTimer(int seconds) {
    remainingTime.value = seconds;
    canResend.value = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        showTime.value = _formatTime(remainingTime.value--);
      } else {
        timer.cancel();
        canResend.value = true;
        showTime.value = "00 Min 00 Secs";
        pincontroller.clear();
      }
    });
  }

  String _formatTime(int seconds) {
    final min = (seconds / 60).floor();
    final sec = seconds % 60;
    return "${min.toString().padLeft(2, '0')} Min ${sec.toString().padLeft(2, '0')} Secs";
  }

  void resetTimer() {
    _timer?.cancel();
    startTimer(180);
  }

  Map setDataFields(LoginModel loginDetail) {
    SessionManager()
        .setDeviceIpAddress(loginDetail.deviceInfo?.ipAddress.toString());

    return {
      'name': SessionManager().getName().toString(),
      'mobile': SessionManager().getMobile().toString(),
      'firebaseToken': loginDetail.fbToken,
      'ipAddress': loginDetail.deviceInfo?.ipAddress,
      'latitude':
          loginDetail.deviceInfo?.currentPosition.latitude.toString() ?? "",
      'longitude':
          loginDetail.deviceInfo?.currentPosition.longitude.toString() ?? '',
      'location': "",
      'os': "",
      'imeiNo': loginDetail.deviceInfo?.imeiNumber.toString(),
      'referralCode': "null",
      'versionName': loginDetail.deviceInfo?.packageInfo.version.toString(),
      'versionNumber':
          loginDetail.deviceInfo?.packageInfo.buildNumber.toString(),
      'modelName': Platform.isAndroid
          ? loginDetail.deviceInfo?.phoneInfo.manufacturer.toString()
          : loginDetail.deviceInfo?.phoneInfo.name.toString(),
      'modelNo': loginDetail.deviceInfo?.phoneInfo.model.toString()
    };
  }

  Future<void> saveUserPrefs(dynamic value) async {
    userResponse = UserModel.fromJson(value);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (userResponse.status.toString() == '1') {
      prefs.setString('user_phone', loginDetail.number ?? '');
      prefs.setString('user_fname', loginDetail.name ?? '');
      SessionManager().addMobile(loginDetail.number!);
      SessionManager().addUserName(loginDetail.name!);
    }
  }

  Future<void> resendOtp() async {
    if (!canResend.value) return;

    loading.value = true;
    userData = setDataFields(loginDetail);

    _otpRepo.sendotp(jsonEncode(userData)).then((value) async {
      loading.value = false;
      await saveUserPrefs(value);
      userResponse = UserModel.fromJson(value);

      print("User Response: ${userResponse.toJson()}");
      print(
          "Resend OTP response: status = ${userResponse.status}, msg = ${userResponse.msg}");

      if (userResponse.status.toString() == '1') {
        CustomToast.show("OTP resent successfully");
        resetTimer();
      } else {
        CustomToast.show(userResponse.msg ?? "Something went wrong");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      debugPrint("Resend OTP Error: $error");
    });
  }

  Future<void> _listenIncomingSms() async {
    if (Platform.isAndroid) {
      final granted = await _telephony.requestSmsPermissions ?? false;
      if (!granted) return;

      _telephony.listenIncomingSms(
        listenInBackground: false,
        onNewMessage: (SmsMessage msg) {
          if (!Get.isRegistered<OTPVerifyController>()) return;

          final body = msg.body ?? '';
          final match = RegExp(r'\b(\d{6})\b').firstMatch(body);

          if (body.contains("AntPay") && match != null) {
            pincontroller.text = match.group(1)!;
          }
        },
      );
    }
  }

  //  Verify OTP
  Future<void> verifyOtp() async {
    final otp = pincontroller.text.trim();

    if (otp.length != 6) {
      CustomToast.show("Enter a valid 6-digit OTP");

      return;
    }

    loading.value = true;

    try {
      final userMobile = SessionManager().getMobile().toString();
      OtpApiRepo repo = OtpApiRepo();
      OTPBean response = await repo.verifyOTP(userMobile, otp);

      if (response.status.toString() == '1') {
        SessionManager().addToken(response.oathToken.toString());
        SessionManager().addCorporateID(response.corporateHrID.toString());

        OtpUserModel? currUser = response.userModel;

        if (currUser != null) {
          SessionManager().createLoginSession(
              currUser.name ?? "",
              currUser.email ?? "",
              currUser.maritalStatus ?? "",
              currUser.dob ?? "",
              currUser.gender ?? "",
              currUser.occupation ?? "",
              currUser.education ?? "",
              currUser.income ?? "",
              currUser.investInEquityMarketFlag ?? "",
              currUser.ownHouseMotorFlag ?? "",
              response.oathToken ?? "");

          SessionManager().setAutofillData(
              currUser.name ?? "",
              currUser.gender ?? "",
              currUser.dob ?? "",
              "",
              "",
              "",
              "",
              currUser.email ?? "",
              SessionManager().getMobile().toString(),
              "",
              "",
              "",
              "",
              "",
              "");
        }

        final sp = await SharedPreferences.getInstance();
        sp.setString('tkntkn', response.oathToken.toString());
        sp.setString('FirebaseToken', response.oathToken.toString());
        sp.setString('first_run', '0.5');

        const nextScreen = 'Profile_page';
        if (nextScreen == 'Profile_page') {
          Get.offAllNamed(RoutesName.dashboard);
        } else if (nextScreen == 'Dashboard') {
          Get.offAllNamed(RoutesName.dashboard);
        } else {
          CustomToast.show("OTP verification failed");
        }
      } else {
        // Get.offAllNamed(RoutesName.dashboard);
        CustomToast.show(response.msg.toString());
      }
    } catch (e, s) {
      CustomToast.show("Something went wrong");
    } finally {
      loading.value = false;
    }
  }
}
