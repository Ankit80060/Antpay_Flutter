import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/reminder_Request/reminder_request.dart';
import 'package:antpay_lite/model/reminder_Request/reminder_response.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelationShipMangerController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  RxBool isLoading = false.obs;
  CommonApiRepo repoClass = CommonApiRepo();
  String get combinedDateTime {
    final date = dateController.text;
    var time = timeController.text;

    if (date.isEmpty) return '';

    if (time.isEmpty) {
      time = '00:00:00';
    } else if (time.length == 5) {
      time = '$time:00';
    }

    return '$date $time';
  }

Future<void> getReminderCallback(String dateTime) async {
  isLoading.value = true; // 🔄 Show loader

  try {
    ReminderRequest request = ReminderRequest(
      mobile: SessionManager().getMobile().toString(),
      date: dateTime,
      aParam: AppConstant.generateAuthParam(
        SessionManager().getMobile().toString(),
      ),
    );

    ReminderResponse response = await repoClass.apiClient.getReminderCallback(
      SessionManager().getToken().toString(),
      AuthToken.getAuthToken(),
      request,
    );

    if (response.status.toString() == "1") {
      CustomToast.show(response.msg.toString());
    } else {
      CustomToast.show(response.msg.toString());
    }
  } catch (e) {
    print("Error fetching callback: $e");
    CustomToast.show("$e");
  } finally {
    isLoading.value = false;
  }
}


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    dateController.dispose();
    timeController.dispose();

    super.onClose();
  }
}
