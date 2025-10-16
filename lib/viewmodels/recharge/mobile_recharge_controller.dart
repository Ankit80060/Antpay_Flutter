import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/recharge_model/circle_list_model.dart';
import 'package:antpay_lite/model/recharge_model/mobile_number_check_model.dart';
import 'package:antpay_lite/model/recharge_model/operator_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/recharge_repository/mobilerecharge_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api/auth_token.dart';
import '../../utils/routes/routes_name.dart';

class MobileRechargeController extends GetxController {
  final mobileNumberController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Contact> contacts = <Contact>[].obs;
  final Rx<MobileNumberCheckResponseModel?> mobileCheckResponse =
      Rx<MobileNumberCheckResponseModel?>(null);
  final RxList<Results> operatorList = <Results>[].obs;
  final RxList<Result> circleList = <Result>[].obs;

  int getTransactionStatusCount=0;

  @override
  void onInit() {
    super.onInit();
    checkContactPermission();
    fetchOperator();
    fetchCircle();
    }


 

  @override
  void onClose() {
    if (Get.isRegistered<MobileRechargeController>()) {
      Get.delete<MobileRechargeController>();
    }
    mobileNumberController.dispose();
    super.onClose();
  }

  Future<void> checkContactPermission() async {
    try {
      if (await Permission.contacts.isGranted) {
      } else {
        var status = await Permission.contacts.request();
        if (status.isDenied) {
          errorMessage.value = "Contacts permission denied. Please enable it.";
          CustomToast.show(errorMessage.value);
        } else if (status.isPermanentlyDenied) {
          errorMessage.value =
              "Contacts permission permanently denied. Please enable in settings.";
          CustomToast.show(errorMessage.value);
          await openAppSettings();
        }
      }
    } catch (e) {
      errorMessage.value = "Error checking contacts permission: $e";
      CustomToast.show(errorMessage.value);
    }
  }

  Future<void> pickContact() async {
    try {
      if (await FlutterContacts.requestPermission()) {
        final contact = await FlutterContacts.openExternalPick();
        if (contact != null && contact.phones.isNotEmpty) {
          String? phoneNumber = contact.phones.first.normalizedNumber;
          if (phoneNumber != null) {
            mobileNumberController.text = phoneNumber.replaceFirst("+91", "");
            SessionManager().addmobNumber(mobileNumberController.text);
          } else {
            errorMessage.value = "No phone number found for selected contact.";
            CustomToast.show(errorMessage.value);
          }
        } else {
          errorMessage.value =
              "No contact selected or no phone number available.";
          CustomToast.show(errorMessage.value);
        }
      } else {
        errorMessage.value = "Permission denied for contacts.";
        CustomToast.show(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "Error picking contact: $e";
      CustomToast.show(errorMessage.value);
    }
  }

  Future<MobileNumberCheckResponseModel> _callCheckMobileNumber(
      MobileNumberCheckRequestModel data) async {
    String token = SessionManager().getToken() ?? '';
    String authToken = AuthToken.getAuthToken() ?? '';

    MobileRechargeRepo repo = MobileRechargeRepo();
    return await repo.checkMobileNumber(token, authToken, data);
  }

  Future<void> checkMobileNumber(BuildContext context) async {
    if (mobileNumberController.text.isEmpty) {
      errorMessage.value = 'Please Enter Mobile Number';
      CustomToast.show(errorMessage.value);
      return;
    }


    MobileNumberCheckRequestModel data = MobileNumberCheckRequestModel(
      aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile() ?? mobileNumberController.text),
      mobile: mobileNumberController.text,
    );

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _callCheckMobileNumber(data);

      mobileCheckResponse.value = response;

      SessionManager().addMobileCheckResponse(
        companyName: response.company ?? '',
        utransactionId: response.utransactionId ?? '',
        state: response.state ?? '',
        ported: response.ported ?? '',
        mobile: response.number ?? mobileNumberController.text,
      );

      if (response.status.toString() == '1') {
        Get.toNamed(RoutesName.amountrechargescreen);
      } else {
        errorMessage.value =
            response.resposneMessage ?? 'Check mobile number failed';
        CustomToast.show(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "Something went wrong: $e";
      CustomToast.show(errorMessage.value);

      if (e.toString().contains("401")) {
        errorMessage.value =
            "Unauthorized: Invalid or expired token. Please log in again.";
        CustomToast.show(errorMessage.value);
        Get.offAllNamed(RoutesName.login);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Results>?> fetchOperator() async {
    try {
      String token = SessionManager().getToken() ?? '';
      String authToken = AuthToken.getAuthToken() ?? '';
      MobileRechargeRepo repo = MobileRechargeRepo();
      OperatorList response = await repo.fetchOperator(token, authToken);

      operatorList.value = response.result ?? [];
      
      return operatorList;
    } catch (e) {
      errorMessage.value = "Error fetching operators: $e";
      CustomToast.show(errorMessage.value);
       if (e.toString().contains("401")) {
        errorMessage.value =
            "Unauthorized: Invalid or expired token. Please log in again.";
        CustomToast.show(errorMessage.value);
        Get.offAllNamed(RoutesName.login);
      }
      return null;
    }
  }
  
  Future<List<Results>?> fetchOperatordth() async {
    try {
      String token = SessionManager().getToken() ?? '';
      String authToken = AuthToken.getAuthToken() ?? '';
      MobileRechargeRepo repo = MobileRechargeRepo();
      OperatorList response = await repo.getOperatorsdth(token, authToken);

      operatorList.value = response.result ?? [];
     
      return operatorList;
    } catch (e) {
      errorMessage.value = "Error fetching operators: $e";
      CustomToast.show(errorMessage.value);
      if (e.toString().contains("401")) {
        errorMessage.value =
            "Unauthorized: Invalid or expired token. Please log in again.";
        CustomToast.show(errorMessage.value);
        Get.offAllNamed(RoutesName.login);
      }
      return null;
    }
  }

  Future<List<Result>?> fetchCircle() async {
    try {
      String token = SessionManager().getToken() ?? '';
      String authToken = AuthToken.getAuthToken() ?? '';
      MobileRechargeRepo repo = MobileRechargeRepo();
      CircleList response = await repo.fetchCircle(token, authToken);

      circleList.value = response.result ?? [];
      
      return circleList;
    }
     catch (e) {
      errorMessage.value = "Error fetching circles: $e";
      CustomToast.show(errorMessage.value);
      if (e.toString().contains("401")) {
        errorMessage.value =
            "Unauthorized: Invalid or expired token. Please log in again.";
        CustomToast.show(errorMessage.value);
        Get.offAllNamed(RoutesName.login);
      }
      return null;
    }
  }
  



}
