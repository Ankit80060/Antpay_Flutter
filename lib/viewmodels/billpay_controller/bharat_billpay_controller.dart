import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/billpay/BBPSGetBillerBean.dart';
import '../../model/billpay/BillersLifeInsurance.dart';
import '../../model/billpay/bill_pay_request.dart';
import '../../model/billpay/getBillers.dart';
import '../../model/billpay/loan_repayment_biller_model.dart';
import '../../repository/billpay_repository/billpay_repo.dart';
import '../../utils/app_constant.dart';
import '../../utils/routes/routes_name.dart';

class BharatBillPayController extends GetxController {
  BillPayRepo repository = BillPayRepo();

  RxBool isLoading = false.obs;
  RxList<Billers> billerData = <Billers>[].obs;
  RxList<BillerInputFields> inpuFieldBillerData = <BillerInputFields>[].obs;
  Billers? selectedBiller;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  List<TextEditingController> textControllers = [];
var billerRetriveData = Rx<LoanBillerResponse?>(null);

  final TextEditingController customAmountController= TextEditingController();

  @override
  void onInit() {
    super.onInit();

    callBillerNameApi();

  }


  Future<void> callBillerNameApi() async {
    try {
      HealthInsuranceRequestModel data = HealthInsuranceRequestModel(
          billerCategory: SessionManager().getServiceType(),
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()));

      HealthInsuranceResponseModel response = await repository.fetchBillerName(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

      if (response.status.toString() == '1') {
        if (response.billers != null) {
          billerData.assignAll(response.billers!);
        }
      } else {
        billerData.clear();
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Validate and fetch details
  void fetchDetailsBtn() {
    if (formKey.currentState?.validate() ?? false) {
      fetchBillerDetails();
    }
  }

  String? getServiceType() {
    return SessionManager().getServiceType();
  }

  @override
  void onClose() {
    searchController.dispose();

    for (var c in textControllers) {
      c.dispose();
    }

    super.onClose();
  }

  void handelBillerSellection(Billers selection) {
    selectedBiller = selection;
    
    callBillerInputFieldApi(selection.billerId);
      
    
    SessionManager().addBillerId(selection.billerId);
    SessionManager().addBilerName(selection.billerName);
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
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
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

  Map<String, dynamic> buildInputParams() {
    final Map<String, dynamic> params = {};

    for (int i = 0; i < inpuFieldBillerData.length; i++) {
      final key = inpuFieldBillerData[i].paramName ?? "field_$i";
      final value = textControllers[i].text;

      params[key] = value.trim();
    }

    return params;
  }

  void fetchBillerDetails() async {
    String billerId = "";
    Map<String, dynamic>? inputParams;

    if (selectedBiller != null) {
      billerId = selectedBiller!.billerId!;
    } else {
      CustomToast.show("Please select biller name");
      return;
    }

    if (textControllers.isNotEmpty) {
      inputParams = buildInputParams();
      if (inputParams.isEmpty) {
        CustomToast.show("Field is Required");
        return;
      }
    }
     isLoading.value = true;

    try {
      FetchBillerModel data = FetchBillerModel(
          biller_category: SessionManager().getServiceType(),
          inputparameter: inputParams,
          mobile: SessionManager().getMobile().toString(),
          billerId: billerId,
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()));

      LoanRepaymentBillerModel response = await repository.fetchBillDetailsApi(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);

      if (response.status.toString() == '1') {
        if (response.billResult != null &&
            response.billResult!.billerResponse != null) {


              
              

              SessionManager().storeBillerDetailsData(response.billResult!);
              SessionManager().addBillerRequestId(response.requestId!);
              Get.toNamed(RoutesName.billerTableDetailsPage);
          // billerRetriveData.value = response.billResult!.billerResponse!;
          // customAmountController.text=billerRetriveData.value!.billAmount.toString();
          //675035918
        }
      } else {
        //  billerRetriveData.value = null;
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
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


 
  
}
