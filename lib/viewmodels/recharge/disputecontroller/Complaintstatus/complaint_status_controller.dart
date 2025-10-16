import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/recharge_model/complain_status_bean.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/recharge_repository/mobilerecharge_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart'; // Import AppConstant
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintStatusController extends GetxController {
  final complaintIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var complainId = ''.obs;

  var isLoading = false.obs;
  var complainStatus = Rxn<ComplainStatusBean>();

  Future<void> submitComplaint() async {
    if (!formKey.currentState!.validate()) {
      CustomToast.show("Please enter a valid Complaint ID");
      return;
    }

    try {
      isLoading.value = true;

      Map<String, dynamic> request = {
        "complain_id": complainId.value,
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      };

      MobileRechargeRepo repo = MobileRechargeRepo();
      var response = await repo.getComplainStatus(
        AuthToken.getAuthToken().toString(),
        SessionManager().getToken().toString(),
        request,
      );

      complainStatus.value = response as ComplainStatusBean;

      CustomToast.show("Complaint status fetched successfully");
    } catch (e) {
      CustomToast.show("Failed to fetch complaint status: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    complaintIdController.dispose();
    super.onClose();
  }
}
