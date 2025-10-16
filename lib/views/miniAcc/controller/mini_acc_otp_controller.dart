import 'dart:async';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_account_beneficiary_request.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_account_beneficiary_response.dart';
import 'package:antpay_lite/model/otp_model/comman_otpVerify_model.dart';
import 'package:antpay_lite/model/otp_model/comman_send_otp_bean.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../prefrences/session_manager.dart';

class MiniAccountOtpController extends GetxController {
  
  TextEditingController otpController = TextEditingController();
  RxString useMobileNumber = ''.obs;
  RxBool isLoading = false.obs;
  var remainingSeconds = 120.obs;
  var timeDisplay = "2 Min 0 Secs".obs;
  Color textColor = Colors.blueAccent;
  Timer? _timer;
  String service;
  MiniAccountOtpController(this.service);
  Map<String, dynamic>? data;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    useMobileNumber.value = SessionManager().getMobile()!;
    data = Get.arguments;
    startTimer();
  }

  void startTimer() {
    remainingSeconds.value = 120;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        timeDisplay.value = remainingSeconds.value > 59
            ? "1 Min ${remainingSeconds.value % 60} Secs"
            : "${remainingSeconds.value} Secs";
        textColor = Colors.blueAccent;
      } else {
        timeDisplay.value = "Time Ended !!";
        textColor = Colors.grey;
        _timer?.cancel();
      }
    });
  }

  commanverifyOtp(
    String mobile,
  ) async {
    isLoading.value = true;
    try {
      String otp = otpController.value.text;

      CommanUserOtpVerifyRequestModel request = CommanUserOtpVerifyRequestModel(
        mobile: SessionManager().getMobile().toString(),
        service: service,
        otp: otp,
      );

      String number = SessionManager().getMobile().toString();

      CommanUserOtpVerifyResponseModel response =
          await CommonApiRepo().apiClient.commanUserOtpVerify(
                AuthToken.getAuthToken(),
                SessionManager().getToken().toString(),
                request,
              );

      if (response.status != null) {
        if (response.status == 1) {
          var token = response.oathToken.toString();
          if (service == "PPI_Mobile_Send_Otp") {
            Get.offNamed(RoutesName.miniAccountForm);
          } else if (service == "Add_Beneficiary") {
              CustomerAccountBeneficiaryResponse customResponse = CustomerAccountBeneficiaryResponse();
            CustomerAccountBeneficiaryRequest request =
                CustomerAccountBeneficiaryRequest(
              aParam: AppConstant.generateAuthParam(
                  SessionManager().getMobile().toString()),
              customerMobile: SessionManager().getMobile().toString(),
              beneficiaryMobile: data?["mobile"],
              customerId: SessionManager().getCustomerId(),
              bankAccountNumber: data?["bankAccountNumber"],
              beneficiaryIFSC: data?["beneficiaryIFSC"],
              paymentDescription: "Direct IMPS",
              transferType: 1,
              currency: "INR",
              beneficiaryName: data?["beneficiaryName"],
              deviceId: SessionManager().getDeviceId(),
              requestIp: SessionManager().getDeviceIpAddress().toString(),
              otp: otpController.value.text,
            );

            customResponse =
                await CommonApiRepo().apiClient.addCustomerAccountBeneficiary(
                SessionManager().getToken().toString(),   AuthToken.getAuthToken(),request);

            if (customResponse.responseCode == "00") {
              CustomToast.show("Beneficiary added successfully");
             Get.back();
            } else {
              CustomToast.show(customResponse.msg.toString());
               Get.back();
            }
            // Navigator.pop(context);
           
            // Get.toNamed(RoutesName.fetchbeneficiaryscreen);
          }
        } else {
          CustomToast.show(response.msg ?? "Something went wrong");
        }
      } else {
        CustomToast.show("Invalid response received");
      }
    } catch (e, stackTrace) {
      CustomToast.show("Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  sendOtp() async {
    isLoading.value = true;
    try {
            CommonSendOtpRequestModel request = CommonSendOtpRequestModel(
    mobile:  SessionManager().getMobile().toString(),
    service: "PPI_Mobile_Send_Otp",
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
        startTimer();
        CustomToast.show("OTP sent successfully");
      } else {
        CustomToast.show(response.msg ?? "Something went wrong");
      }
    } catch (e) {
      CustomToast.show("Error sending OTP");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _timer?.cancel();
    if (Get.isRegistered<MiniAccountOtpController>()) {
      Get.delete<MiniAccountOtpController>();
    }
  }
}
