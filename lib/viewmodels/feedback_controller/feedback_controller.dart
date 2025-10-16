import 'dart:convert';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/feedback/feedback_request_get.dart';
import 'package:antpay_lite/model/feedback/feedback_request_save.dart';
import 'package:antpay_lite/model/feedback/feedback_response_get.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  CommonApiRepo repoClass = CommonApiRepo();
  var isLoading = false.obs;
  RxList<UserFeedbackEntry> feedbackList = RxList<UserFeedbackEntry>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phoneController.text = SessionManager().getMobile() ?? "";
    nameController.text = SessionManager().getName() ?? "";
    getFeedback();
  }

  Future<void> submitFeedback() async {
    if (phoneController.text.isEmpty ||
        messageController.text.isEmpty ||
        subjectController.text.isEmpty ||
        nameController.text.isEmpty) {
      CustomToast.show("All Fields are Required");
      return;
    }

    isLoading.value = true;

    try {
      final FeedbackRequestSave request = FeedbackRequestSave(
        userData: UserData(
          mobile: SessionManager().getMobile().toString(),
          userFeedback: messageController.text,
          aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString(),
          ),
        ),
      );
      print("📤 Request Body: ${jsonEncode(request.toJson())}");

      final response = await repoClass.apiClient.saveFeedback(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request.toJson(),
      );

      if (response.status == "Successfully Added") {
        showSuccessAlert("Successfully Added");
      } else {


        showSuccessAlert("Please try again");
      }
    } catch (e) {
      print("Error submitting feedback: $e");
    } finally {
      isLoading.value = false;
    }
  }

 Future<void> getFeedback() async {
  isLoading.value = true;

  try {
    final FeedbackRequestGet request = FeedbackRequestGet(
      userData: UserDataGet(
        mobile: SessionManager().getMobile().toString(),
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      ),
    );
    FeedbackResponseGet response = await repoClass.apiClient.getFeedback(
      SessionManager().getToken().toString(),
      AuthToken.getAuthToken(),
      request,
    );
   print("Listt${response.userData.first.userId}") ;
    if (response.userData.isNotEmpty) {
      feedbackList.assignAll(response.userData);
    } else {
      CustomToast.show("No feedback found");
    }
  } catch (e) {
    print("Error feedback List $e");
  } finally {
    isLoading.value = false;
  }
}


  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }

  void showSuccessAlert(String msg) {
    Get.dialog(
      
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(msg, style: CustomStyles.black14500),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 12),
              Text(
                "Your Feedback has been Succesfully Sent to Us. We will get back to you shortly.",
                style: CustomStyles.black12400,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: CustomElevatedButton(width: 120,
                  textstyle: CustomStyles.black12400,
                  onPressed: () {
                 Get.offAllNamed(
                      RoutesName.dashboard,
                      arguments: {'bottomNavIndex': 0},
                    );
                },text: "Return to Home",)
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false
    );
  }
}
