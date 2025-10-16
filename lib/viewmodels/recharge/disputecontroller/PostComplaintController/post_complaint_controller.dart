import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/recharge_model/post_complain.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/recharge_repository/mobilerecharge_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostComplaintController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Dropdown values
  final complaintTypeList = ['SSID', 'Other'];
  final selectedComplaintType = RxnString();

  // Text controllers
  final transactionIdController = TextEditingController();
  final messageController = TextEditingController();

  // Loading and response
  final isLoading = false.obs;
  final complaintResponse = Rxn<PostComplain>(); // reactive for API response

  @override
  void onInit() {
    super.onInit();
    selectedComplaintType.value = complaintTypeList.first;
  }

  void setComplaintType(String? value) {
    if (value != null) {
      selectedComplaintType.value = value;
    }
  }

  Future<void> submitComplaint() async {
    if (!formKey.currentState!.validate()) {
      CustomToast.show("Please fill all required fields");
      return;
    }

    try {
      isLoading.value = true;

      final request = PostComplain(
        type: selectedComplaintType.value?.toLowerCase(),
        msg: messageController.text.trim(),
        utransid: transactionIdController.text.trim(),
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      final repo = MobileRechargeRepo();

      final response = await repo.submitComplaintApi(
        request,
        AuthToken.getAuthToken().toString(),
        SessionManager().getToken().toString(),
      );

      complaintResponse.value = response;

      if (response.responseMessage != null &&
          response.responseMessage!.isNotEmpty) {
        CustomToast.show(response.responseMessage!);
      }
    } catch (e) {
      CustomToast.show("Failed to submit complaint: $e");
      print("Error submitting complaint: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    transactionIdController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
