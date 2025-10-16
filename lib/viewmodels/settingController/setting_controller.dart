import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isAllNotificationOn = false.obs;
  RxBool isOfferNotificationOn = false.obs;
  RxBool isOtherNotificationOn = false.obs;
  var selectedLanguage = ''.obs;

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }
  void handleAllNotificationSwitch(bool value) {
    isAllNotificationOn.value = value;
  }

  void handleOfferNotificationSwitch(bool value) {
    isOfferNotificationOn.value = value;
  }

  void handleOtherNotificationSwitch(bool value) {
    isOtherNotificationOn.value = value;
  }
}
