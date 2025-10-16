import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/otp_model/comman_send_otp_bean.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/views/miniAcc/mini_acc_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBeneficiaryController extends GetxController {
   RxBool isLoading = false.obs;
  var selectedGroup = ''.obs;
    final groupList = [
  "Family", "Friend", "Others"
  ];
  final nameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final reEnterAccountNumberController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final mobileNumberController = TextEditingController();

  sendOtp() async {
      isLoading.value = true;
    try {

        CommonSendOtpRequestModel request = CommonSendOtpRequestModel(
    mobile:  SessionManager().getMobile().toString(),
    service: "Add_Beneficiary",
    aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
  );
      CommonSendOtpResponseModel response =
          await CommonApiRepo().apiClient.commanUserSendOtp(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
     request
      );

      if (response.status == 1) {
       Get.to(()=>MiniAccOtpPage(service: "Add_Beneficiary",    ),arguments: {
      "beneficiaryName": nameController.text.trim(),
      "bankAccountNumber": accountNumberController.text.trim(),
      "reEnterAccountNumber": reEnterAccountNumberController.text.trim(),
      "beneficiaryIFSC": ifscCodeController.text.trim(),
      "mobile": mobileNumberController.text.trim(),
      "group": selectedGroup.value,
    },);
      } else {
        CustomToast.show(response.msg ?? "Something went wrong");
      }
    } catch (e) {
      CustomToast.show("Error sending OTP");
    }finally {
      isLoading.value = false;
    }
  }

 
  @override
  void onClose() {
    nameController.dispose();
    accountNumberController.dispose();
    reEnterAccountNumberController.dispose();
    ifscCodeController.dispose();
    mobileNumberController.dispose();
    super.onClose();
  }
}
