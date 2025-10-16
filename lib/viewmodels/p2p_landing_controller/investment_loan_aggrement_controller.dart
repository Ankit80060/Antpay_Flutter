import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/otp_model/comman_send_otp_bean.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/views/p2p_lending/investment_verifiaction_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanAgreementController extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();
  var approvedAmount = '10000'.obs;
  var repaymentAmount = '12500'.obs;
  var tenure = '1'.obs;
  var interest = '12.5'.obs;
  var agreement = ''.obs;
  var isLoading = true.obs;
  var isbtnLoading = false.obs;
  var inlineSpans = <InlineSpan>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSanctionDetails();
    showLoanAgreement();
  }

  void fetchSanctionDetails() {
    approvedAmount.value = '10000';
    repaymentAmount.value = '12500';
    tenure.value = '1';
    interest.value = '12.5';
  }

  void showLoanAgreement() async {
    try {
      isLoading.value = true;
      final response =
          await repoClass.lenSocialApiClient.getLoanAgreementlendsocial(
        "TVRJek5EVT0=",
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
      );

      if (response.status == 1 && response.agreement != null) {
        agreement.value = response.agreement!;
      } else {
        agreement.value = 'Agreement content not found.';
      }
    } catch (e, st) {
      print("Agreement fetch error: $e");
      agreement.value = 'Error loading agreement.';
    } finally {
      isLoading.value = false;
    }
  }

  sendOtp() async {
    isbtnLoading.value = true;
    try {
      CommonSendOtpRequestModel request = CommonSendOtpRequestModel(
        mobile: SessionManager().getMobile().toString(),
        service: "PPI_Mobile_Send_Otp",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      );
      CommonSendOtpResponseModel response = await CommonApiRepo()
          .apiClient
          .commanUserSendOtp(SessionManager().getToken().toString(),
              AuthToken.getAuthToken(), request);

      if (response.status == 1) {
        Get.to(() => InvestmentVerifyOTPScreen());
      } else {
        CustomToast.show(response.msg ?? "Something went wrong");
      }
    } catch (e) {
      CustomToast.show("Error sending OTP");
    } finally {
      isbtnLoading.value = false;
    }
  }
}
