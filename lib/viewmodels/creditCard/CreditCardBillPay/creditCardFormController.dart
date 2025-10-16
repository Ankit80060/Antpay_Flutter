

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../model/billpay/BBPSGetBillerBean.dart';
import '../../../model/billpay/BillersLifeInsurance.dart';
import '../../../model/billpay/FetchBillBean.dart';
import '../../../model/billpay/getBillers.dart';
import '../../../prefrences/session_manager.dart';
import '../../../repository/billpay_repository/billpay_repo.dart';
import '../../../utils/app_constant.dart';

class CreditCardFormController extends GetxController {




  BillPayRepo repository = BillPayRepo();

  final crediFormKey = GlobalKey<FormState>();
  List<TextEditingController> textControllers = [];
  RxList<BillerInputFields> inpuFieldBillerData = <BillerInputFields>[].obs;


  RxBool isLoading = false.obs;
  RxList<Billers> creditCardData = <Billers>[].obs;

  


  var numberController = TextEditingController();

  var loading = false.obs;

  var fetchDetailsBtn;

  @override
  void onInit() {
    super.onInit();
    fetchCreditCardList();
  }

   @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
 if (Get.isRegistered<CreditCardFormController>()) {
      Get.delete<CreditCardFormController>();
    }
    numberController.dispose();
    
  }

  void fetchCreditCardList() async {
    try {
      HealthInsuranceRequestModel data = HealthInsuranceRequestModel(
          billerCategory: "Credit Card",
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()));

      HealthInsuranceResponseModel response = await repository.fetchBillerName(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

      if (response.status.toString() == '1') {
        if (response.billers != null) {
          creditCardData.assignAll(response.billers!);
        }
      } else {
        creditCardData.clear();
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  
  
  Future<void> fetchCreditCardDetails() async {

    // if (billerOperatorData.value==null) {
    //   CustomToast.show("Please select biller");
    //   return;
    // }

    
     if (!(crediFormKey.currentState?.validate() ?? false)) {
    return;
  }

    try {
     isLoading.value = true;
      final data = FetchBillRequestModel(
        Operator_Code: "45",
        number: numberController.text,
      );
      FetchBillBean response = await repository.fetchBillerServiceDetails(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),

          data);

      if (response.status.toString() == '1') {
        SessionManager.storePostPaidRetriveData(response.addinfo!);

        // Get.toNamed(RoutesName.postPaidTableDetailsPage);

        
        
        
      } else {
        CustomToast.show(response.errormsg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }



  }


  void handelBillerSellection(Billers selection) {
callBillerInputFieldApi(selection.billerId);
    // getOperatorName(selection.Operator_Code!,selection.Operator_Name!);
  }

  Future<void> callBillerInputFieldApi(id) async {
     isLoading.value = true;
    try {
      BillersRequestModel data = BillersRequestModel(
          billerId: id,
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()));

      BillersLifeInsurance response = await repository.fetchBillerInputField(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

      if (response.status.toString() == '1') {
        if (response.inputfield != null) {
          inpuFieldBillerData.assignAll(response.inputfield!);
          textControllers = List.generate(
            inpuFieldBillerData.length,
            (index) => TextEditingController(),
          );
        }
      } else {
        inpuFieldBillerData.clear();
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

   String? getServiceType() {
    return SessionManager().getServiceType();
  }

  String? checkVaklidation(String? value) {

    if (value == null || value.isEmpty) {
      return "Please enter 'number'}";
    }
    if (value.length != 10) {
      return "Number must be 10 digits";
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return "Enter a valid mobile number";
    }
    return null;
  
  }


  TextInputType getKeyboardType(String? dataType) {
    switch (dataType?.toUpperCase()) {
      case "NUMERIC":
        return TextInputType.number;
      case "ALPHABETIC":
        return TextInputType.name;
      case "ALPHANUMERIC":
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }


  validateField(String? value, BillerInputFields fieldData) {
    final isOptional = fieldData.isOptional?.toString().toLowerCase() == "true";
    final minLength = int.tryParse(fieldData.minLength ?? "0") ?? 0;
    final maxLength = int.tryParse(fieldData.maxLength ?? "100") ?? 100;
    final dataType = fieldData.dataType?.toString().toUpperCase();
    final regExPattern = fieldData.regEx;

    if (!isOptional && (value == null || value.isEmpty)) {
      return "${fieldData.paramName ?? "Field"} is required";
    }

    if (value != null && value.isNotEmpty) {
      //  Min Length
      if (value.length < minLength) {
        return "${fieldData.paramName} must be at least $minLength characters";
      }

      //  Max Length
      if (value.length > maxLength) {
        return "${fieldData.paramName} must not exceed $maxLength characters";
      }

      // DataType check
      if (dataType == "NUMERIC" && !RegExp(regExPattern!).hasMatch(value)) {
        return "${fieldData.paramName} must contain only numbers";
      }
      if (dataType == "ALPHABETIC" && !RegExp(regExPattern!).hasMatch(value)) {
        return "${fieldData.paramName} must contain only letters";
      }
      if (dataType == "ALPHANUMERIC" &&
          !RegExp(regExPattern!).hasMatch(value)) {
        return "${fieldData.paramName} must be $regExPattern";
      }

      // Custom RegEx
      if (regExPattern != null && regExPattern.toString().isNotEmpty) {
        final regex = RegExp(regExPattern);
        if (!regex.hasMatch(value)) {
          return "${fieldData.paramName} is invalid format";
        }
      }
    }

    return null;
  }

  



}