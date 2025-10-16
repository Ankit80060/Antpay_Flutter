import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/Profile/profile_update_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var currentStep = 0.obs;
  var isLoading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();

  var selectedMaritalStatus = Rxn<String>();
  var selectedOccupation = Rxn<String>();
  var selectedEducation = Rxn<String>();
  var selectedAnnualIncome = Rxn<String>();
  var imagePic = ''.obs;

  final maritialList = ["Single", "Married"];
  var gender = "Male".obs;
  var selectInvest = "Yes".obs;
  var selectOwnAssets = "Yes".obs;
  final occupationList = [
    'SALARIED',
    'SELF-EMPLOYED',
    'RETIRED',
    'HOME MAKER',
    'STUDENT',
    'NOT WORKING',
    'AGRICULTURE',
    'BUSINESS'
  ];
  final educationList = [
    'UPTO 10',
    'UNDER GRADUATE',
    'GRADUATE',
    'POST GRADUATE',
    'PROFESSIONAL',
    'NOT APPLICABLE'
  ];
  final annualIncomeList = [
    "0-1L",
    "1L-5L",
    "5L-10L",
    "10L-25L",
    "25L- 50L",
    "50L-1C"
  ];

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();

    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    final session = SessionManager();
    final name = session.getName();
    if (name != null && name.isNotEmpty) {
      nameController.text = name;
    }

    final email = session.getUserEmail();
    if (email != null && email.isNotEmpty) {
      emailController.text = email;
    }

    final mobile = session.getMobile();
    if (mobile != null && mobile.isNotEmpty) {
      mobileController.text = mobile;
    }
    gender.value = session.getUserGender() == "1" ? "Male" : "Female";
    selectOwnAssets.value = session.getUserOwnAssets() == "1" ? "Yes" : "No";
    selectInvest.value =
        session.getUserInvestmentStatus() == "1" ? "Yes" : "No";

    dobController.text = session.getUserDOB() ?? "";
    final marital = session.getUserMaritalStatus() ?? "";
    if (maritialList.contains(marital)) {
      selectedMaritalStatus.value = marital;
    } else {
      selectedMaritalStatus.value = null;
    }

    final occupation = session.getUserOccupation() ?? "";
    if (occupationList.contains(occupation.toUpperCase())) {
      selectedOccupation.value = occupation.toUpperCase();
    } else {
      selectedOccupation.value = null;
    }
    final education = session.getUserEducation() ?? "";
    if (educationList.contains(education.toUpperCase())) {
      selectedEducation.value = education.toUpperCase();
    } else {
      selectedEducation.value = null;
    }
    final income = session.getUserIncome() ?? "0";
    if (annualIncomeList.contains(income)) {
      selectedAnnualIncome.value = income;
    } else {
      selectedAnnualIncome.value = null;
    }
  }

  Future<void> updateProfile() async {
    isLoading.value = true;
    try {
      ProfileUpdateRequestModel request = ProfileUpdateRequestModel(
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        company_name: "",
        dob: dobController.text.trim(),
        email: emailController.text.trim(),
        income: selectedAnnualIncome.value ?? '',
        invest_in_equity_market_flag: selectInvest.value == "Yes" ? "1" : "0",
        marital_status: selectedMaritalStatus.value ?? '',
        mobile: SessionManager().getMobile() ?? '',
        name: nameController.text.trim(),
        gender: gender.value == "Male" ? "1" : "0",
        occupation: selectedOccupation.value ?? '',
        own_house_motor_flag: selectOwnAssets.value == "Yes" ? "1" : "0",
        profile_img: SessionManager().getProfilePic(),
        qualification: selectedEducation.value ?? '',
      );

      CommonApiRepo repo = CommonApiRepo();
      final response = await repo.apiClient.profileUpdate(
        SessionManager().getToken() ?? '',
        AuthToken.getAuthToken(),
        request,
      );

      if (response.status.toString() == "1") {
        SessionManager().createLoginSession(
          nameController.text.trim(),
          emailController.text.trim(),
          selectedMaritalStatus.value ?? '',
          dobController.text.trim(),
          gender.value == "Male" ? "1" : "0",
          selectedOccupation.value ?? '',
          selectedEducation.value ?? '',
          selectedAnnualIncome.value ?? '',
          selectInvest.value == "Yes" ? "1" : "0",
          selectOwnAssets.value == "Yes" ? "1" : "0",
          SessionManager().getToken().toString(),
        );
        Get.offAllNamed(
          RoutesName.dashboard,
          arguments: {'bottomNavIndex': 0},
        );

        CustomToast.show(response.msg.toString());
      } else {
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
