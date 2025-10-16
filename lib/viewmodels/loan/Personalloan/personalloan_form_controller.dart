import 'dart:io';

import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/model/place_model/qualification_model.dart';
import 'package:antpay_lite/model/place_model/state_code_request.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalLoanController extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();

  var selectedGender = ''.obs;
  var selectedselectedMaritalStatus = ''.obs;
  var selectedDob = ''.obs;
  var selectedIncome = Rxn<String>();
  var selectedLoanAmount = ''.obs;
  RxList<City> cityList = <City>[].obs;
  Rxn<City> selectedCity = Rxn<City>();
  var selectedState = Rxn<StateList>();
  var stateList = <StateList>[].obs;
  RxList<QualificationList> qualificationList = <QualificationList>[].obs;
  Rxn<QualificationList> selectedEducation = Rxn<QualificationList>();

  final genderList = ['Male', 'Female'];
  final maritalList = ["Single", "Married", "Divorced"];

  final incomeList = ["0 - 3L", "3L - 6L", "6L - 10L", "10L - 20L", "20L+"];
  final educationList = [
    'UPTO 10',
    'UNDER GRADUATE',
    'GRADUATE',
    'POST GRADUATE',
    'PROFESSIONAL',
    'NOT APPLICABLE'
  ];
  RxList<OccupationList> occupationList = <OccupationList>[].obs;
  Rxn<OccupationList> selectedOccupation = Rxn<OccupationList>();
  final lastNameController = TextEditingController();
  final panController = TextEditingController();
  final loanAmountController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final TextEditingController firstNameController =
      TextEditingController(text: SessionManager().getName().toString());
  final TextEditingController emailController =
      TextEditingController(text: SessionManager().getUserEmail().toString());
  final TextEditingController mobileController =
      TextEditingController(text: SessionManager().getMobile().toString());
  final TextEditingController dobController = TextEditingController();

  void onInit() {
    super.onInit();
    fetchStateList();
    initQualifications();
    initOccupations();

    // selectedGender.value = SessionManager().getUserGender() ?? genderList.first;
  }

  initCityList(String? stateCode) async {
    try {
      StateCodeRequest request = StateCodeRequest(state_code: stateCode);

      CityListResponse response =
          await repoClass.p2pApiClient.getCityList(request);

      if (response.status == 1) {
        cityList.assignAll(response.cityList ?? []);
      } else {
        CustomToast.show('City List fetch failed!');
      }
    } catch (e) {
      print("Error fetching city list: $e");
    }
  }

  initOccupations() async {
    try {
      Occupation response = await repoClass.p2pApiClient.getOccupations();
      if (response.status == 1) {
        occupationList.assignAll(response.list ?? []);
      } else {
        CustomToast.show("Failed to fetch occupations!");
      }
    } catch (e) {
      CustomToast.show("Error fetching occupations");
    }
  }

  initQualifications() async {
    try {
      Qualification response = await repoClass.p2pApiClient.getQualifications();
      if (response.status == 1) {
        qualificationList.assignAll(response.list ?? []);
      }
    } catch (e) {
      print("Error fetching Qualification list: $e");
      CustomToast.show("Error fetching qualifications");
    }
  }

  fetchStateList() async {
    try {
      StateModel response = await repoClass.p2pApiClient.getStateList();

      if (response.status == 1) {
        stateList.assignAll(response.stateList ?? []);
      }
    } catch (e) {
      print("Error fetching state list: $e");
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    panController.dispose();
    loanAmountController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    super.onClose();
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }
}
