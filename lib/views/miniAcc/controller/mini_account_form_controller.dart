import 'dart:io';
import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/state_code_request.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/model/ppi_kyc_reg_user_model/ppi_kyc_reg_user_request_model.dart';
import 'package:antpay_lite/model/ppi_kyc_reg_user_model/ppi_kyc_reg_user_response_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniAccountController extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();

  var selectedState = Rxn<StateList>();
  RxList<City> cityList = <City>[].obs;
  Rxn<City> selectedCity = Rxn<City>();

  var selectedGender = ''.obs;
  var selectedDob = ''.obs;
  var selectedOccupation = Rxn<String>();
  var selectedEducation = Rxn<String>();
  var selectedAnnualIncome = Rxn<String>();

  // Dropdown options
  final genderList = [
    'Male',
    'Female',
  ];
  var stateList = <StateList>[].obs;

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

  final aadhaarController = TextEditingController();
  final panController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  fetchStateList() async {
    try {
      StateModel response = await repoClass.p2pApiClient.getStateList();

      if (response.status == 1) {
        stateList.assignAll(response.stateList ?? []);
      }
    } catch (e) {
    }
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
    }
  }

  Future<void> getFormData() async {
    try {
      final deviceId = await _getId();
      PpiRegisterUserRequest req = PpiRegisterUserRequest(
          addressDetails: AddressDetails(
            address1: addressController.value.text,
            address2: '',
            city: selectedCity.value?.stateCode ?? '',
            country: 'India',
            state: selectedState.value?.code ?? '',
            zipCode: pincodeController.value.text,
          ),
          clientTxnId: '',
          customerDetails: CustomerDetails(
            dateOfBirth: dobController.value.text,
            emailAddress: emailController.value.text,
            firstName: firstNameController.value.text,
            gender: selectedGender.value == "Male" ? 'M' : 'F',
            lastName: lastNameController.value.text,
            mobileNumber: SessionManager().getMobile(),
          ),
          customerId: '',
          docList: [
            DocList(ovdNo: aadhaarController.value.text, ovdType: 'Aadhar'),
            DocList(ovdNo: panController.value.text, ovdType: 'Pancard'),
          ],
          form60: true,
          formFactorRequired: true,
          initialLoad: 0,
          kycProfile: '30',
          messageCode: '3510',
          productId: '1',
          requestDateTime: DateTime.now().toIso8601String(),
          riskCategory: 'LOW',
          riskScore: '',
          sorCustomerId: '',
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          walletActiveDeviceID: deviceId);

      PpiRegisterUserResponse response =
          await repoClass.apiClient.ppiMIniKycRegUser(
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        req,
      );

      if (response.status.toString() == "1") {
        String msg = response.responseMessage ?? "Succesfull!";
        Get.toNamed(RoutesName.miniAccountFormSuccess, arguments: {
          "message": msg,
        });
      } else  if (response.status.toString() == "0") {
    
          String msg = response.errMsg ?? "Failed!";
           CustomToast.show(msg);
          
        } else {
           String msg = response.errMsg ?? "Failed!";
           CustomToast.show(msg);
        }
    } catch (e) {
      CustomToast.show("Something went wrong. Please try again!");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchStateList();
  }

  @override
  void onClose() {
    aadhaarController.dispose();
    panController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    pincodeController.dispose();
    addressController.dispose();
    dobController.dispose();
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
  }
}
