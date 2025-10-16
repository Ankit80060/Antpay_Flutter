import 'package:antpay_lite/model/device_model/check_user_auth_model.dart';
import 'package:antpay_lite/prefrences/utility_prefrences.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initApp();
  }
  final UtilityPreferences _utilityPreferences = UtilityPreferences();
 _initApp() async {
  // 2 second ka splash delay
  await Future.delayed(const Duration(seconds: 2));

  final isLoggedIn = SessionManager().userLoggedIn();
  final isOnboarded = await _utilityPreferences.getString('isOnboarded', 'false');

  debugPrint('isLoggedIn: $isLoggedIn, token: ${SessionManager().getToken()}, isOnboarded: $isOnboarded');

  if (isLoggedIn && SessionManager().getToken()?.isNotEmpty == true) {

    CheckUserAuthModel a = await checkUserToken();
    if (a.tokenStatus == true) {
      Get.offAllNamed(RoutesName.dashboard);
    } else {
      Get.offAllNamed(RoutesName.userAlertScreen); 
    }
  } else if (isOnboarded == 'false') {
    
    await _utilityPreferences.setString('isOnboarded', 'true');
    Get.offAllNamed(RoutesName.onboarding);
  } else {

    Get.offAllNamed(RoutesName.login);
  }
}


 Future<CheckUserAuthModel> checkUserToken() async {
    CommonApiRepo repo = CommonApiRepo();

    var response = await repo.apiClient.checkUserAuthentication(
        AuthToken.getAuthToken(), SessionManager().getToken().toString(), {
      "mobile": SessionManager().getMobile().toString(),
      "aParam":
      AppConstant.generateAuthParam(SessionManager().getMobile().toString())
    });

   

    return response;


  }}