import 'dart:convert';
import 'dart:io';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/auth_model/fetch_user_model.dart';
import 'package:antpay_lite/model/auth_model/login_model.dart';
import 'package:antpay_lite/model/auth_model/user_model.dart';
import 'package:antpay_lite/model/auth_model/user_name_model.dart';
import 'package:antpay_lite/model/device_model/device_information.dart';
import 'package:antpay_lite/model/device_model/info_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/login_repository/login_repository.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  final _loginRepo = LoginRepository();
  CommonApiRepo repoClass = CommonApiRepo();

  var simNumbers = <String>[].obs;
  RxBool isDialogShown = false.obs;
  RxBool isAcknowledgeChecked = true.obs;
  RxBool isCheckedpolicy = true.obs;
  RxBool isLoading = false.obs;
  RxBool isNewUser = false.obs;
  RxBool fieldsEnabled = true.obs;
  RxString username = ''.obs;
  RxString firebaseToken = ''.obs;
  late final deviceInfoSingleton;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // Controllers
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // Tap gestures
  late TapGestureRecognizer tapGestureTC = TapGestureRecognizer();
  late TapGestureRecognizer tapGesturePolicy = TapGestureRecognizer();

  // Login data
  final loginDetail = LoginModel();
  final DeviceInfoModel deviceInfoModel = DeviceInfoModel();

  late Map userData;
  late UserModel userResponse;

  // ------------------------ SIM/Permission Logic ------------------------
  Future<void> checkPermissionAndLoadSims() async {
    if (isDialogShown.value) return;

    final status = await Permission.phone.status;
    if (status.isGranted) {
      await loadSimCards();
    } else {
      final result = await Permission.phone.request();
      if (result.isGranted) await loadSimCards();
    }
  }

  Future<void> loadSimCards() async {
    try {
      if (await MobileNumber.hasPhonePermission) {
        isLoading.value = true;

        final mobile = await MobileNumber.mobileNumber;

        List<SimCard>? sims = await MobileNumber.getSimCards;

        if (sims == null || sims.isEmpty) {
          Get.snackbar("SIM Error", "No Sim Detected");
          isDialogShown.value = true;
          isLoading.value = false;
          return;
        }

        simNumbers.clear();
        for (var sim in sims) {
          var number = sim.number ?? '';
          if (number.isNotEmpty) simNumbers.add(number);
        }

        Future.delayed(
          const Duration(milliseconds: 300),
          () => showSimDialog(),
        );

        isLoading.value = false;
      } else {
        await MobileNumber.requestPhonePermission;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  void showSimDialog() {
    if (isDialogShown.value) return;

    isDialogShown.value = true;

    Get.dialog(
      Dialog(
        elevation: 2,
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text('Continue With',
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.grey)),
              ),
              const SizedBox(height: 14),
              Flexible(
                child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: simNumbers.length,
                      itemBuilder: (_, i) => ListTile(
                        leading: const Icon(Icons.sim_card),
                        title: Text(simNumbers[i]),
                        onTap: () {
                          Get.back();
  var selected = simNumbers[i];
  if (selected.startsWith('+91')) {
    selected = selected.substring(3);
  }
  selected = selected.replaceAll(RegExp(r'\D'), '');
  if (selected.length > 10) {
    selected = selected.substring(selected.length - 10); 
  }
  isAcknowledgeChecked.value = true;
  phoneController.text = selected;
                        },
                      ),
                    )),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('NONE OF THE ABOVE'),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    ).then((_) {
      isDialogShown.value = false;
    });
  }

  Future<void> sendOTP() async {
    isLoading.value = true;

    userData = setDataFields(loginDetail);

    _loginRepo.sendotp(jsonEncode(userData)).then((value) async {
      isLoading.value = false;

      await saveUserPrefs(value);

      if (userResponse.status.toString() == '1') {
        Get.offNamed(RoutesName.otpVerify);
      } else if (userResponse.status.toString() == '0') {
 
        CustomToast.show(userResponse.msg.toString());
      } else {}
    }).onError((error, stackTrace) {
      isLoading.value = false;
    });
  }

  Map setDataFields(LoginModel loginDetail) {
    SessionManager()
        .setDeviceIpAddress(loginDetail.deviceInfo?.ipAddress.toString());

    return {
      'name': loginDetail.name,
      'mobile': loginDetail.number,
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

  Future<String?> fetchMerchantName(String mobile) async {
    isLoading.value = true;
    String? resultName;

    try {
      UsernameRequest req = UsernameRequest(mobile: mobile);
      UsernameResponse res = await repoClass.apiClient.getUsername(req);

      if (res.msg == "found") {
        String decrypted = decryptBase64(res.encryptedName ?? '');
        isNewUser.value = false;
        fieldsEnabled.value = false;
        isAcknowledgeChecked.value = true;

        SessionManager().addUserName(decrypted);
      } else {
        isNewUser.value = true;
        fieldsEnabled.value = true;
        isAcknowledgeChecked.value = false;
      }

      resultName = "${res.fname ?? ''} ${res.lname ?? ''}".trim();
    } catch (e) {
    } finally {
      isLoading.value = false;
    }

    return resultName;
  }

  String decryptBase64(String encryptedName) {
    final decoded = base64.decode(encryptedName);
    return utf8.decode(decoded);
  }

  String setUserDetails(dynamic value) {
    FetchUserModel model = FetchUserModel.fromJson(value);
    if (model.status.toString() == "1") {
      return "${model.fname} ${model.lname}";
    }
    return "";
  }

  String getMaskedName(String name) {
    if (name.toString().isEmpty) {
      return '';
    }
    final firstCharacter = name[0];
    final lastCharacter = name[name.length - 1];
    final middleCharacters = name.substring(1, name.length - 1);

    final obscuredMiddle = '*' * middleCharacters.length;

    final obscuredText = '$firstCharacter$obscuredMiddle$lastCharacter';

    return obscuredText;
  }

  // ------------------------ Lifecycle ------------------------

  updateFieldsEnabled(bool value) {
    fieldsEnabled.value = value;
    //  isAcknowledgeChecked.value = value;
  }

  bool validateInputs() {
    if (phoneController.text.isEmpty) {
      CustomToast.show("Please Enter Mobile Number");
      return false;
    }
    if(phoneController.text
    .length != 10){
      CustomToast.show("Mobile Number Should be 10 digits");
      return false;
    }
    if (isNewUser.value && nameController.text.isEmpty) {
      CustomToast.show("Please Enter Name");
      return false;
    }
    if (isNewUser.value == true && isAcknowledgeChecked.value == false) {
      CustomToast.show("Please Accept the Terms & Conditions");
      return false;
    }
    if (!isCheckedpolicy.value) {
      CustomToast.show("Please Accept the Terms & Conditions");
      return false;
    }
    return true;
  }

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

  @override
  void onInit() {
    super.onInit();
    checkPermissionAndLoadSims();
    _initFirebaseToken();
    deviceInfoSingleton = DeviceInfoSingleton();
  }

  @override
  void onClose() {
    if (Get.isRegistered<LoginController>()) {
      Get.delete<LoginController>();
    }
    tapGestureTC.dispose();
    tapGesturePolicy.dispose();
    super.onClose();
  }
}
