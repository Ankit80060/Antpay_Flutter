import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/billpay/BBPSGetBillerBean.dart';
import 'package:antpay_lite/model/billpay/BillersLifeInsurance.dart';
import 'package:antpay_lite/model/billpay/FastageModelbillavenue.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/billpay_repository/billpay_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/views/recharge/fastag_recharge/FastagBillCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/billpay/bill_pay_request.dart';
import '../../../utils/routes/routes_name.dart';

class FastagRechargeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BillPayRepo repository = BillPayRepo();

  RxBool isLoading = false.obs;
  RxList<Billers> billerData = <Billers>[].obs;
  RxList<BillerInputFields> inpuFieldBillerData = <BillerInputFields>[].obs;
  Billers? selectedBiller;
  final TextEditingController searchController = TextEditingController();
  List<TextEditingController> textControllers = [];

  // var billerRetriveData = Rx<GetBillerResponse?>(null);
  var serviceType = "".obs;

//HR26FA3121
  @override
  void onInit() {
    super.onInit();

    callBillerNameApi(serviceCategory: "fastag");
    
    serviceType.value = "Fastag"; // default

  }

  Future<void> callBillerNameApi({required String serviceCategory}) async {
    isLoading.value = true;
    try {
      HealthInsuranceRequestModel data = HealthInsuranceRequestModel(
        billerCategory: serviceCategory, // Pass value like "Fastag"
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      HealthInsuranceResponseModel response = await repository.fetchBillerName(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );

      if (response.status.toString() == '1') {
        if (response.billers != null) {
          billerData.assignAll(response.billers!);
        }
      } else {
        billerData.clear();
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

  // Validate and fetch details
  void fetchDetailsBtn() {
    if (formKey.currentState?.validate() ?? false) {
      fetchBillerDetails();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    if (Get.isRegistered<FastagRechargeController>()) {
      Get.delete<FastagRechargeController>();
    }

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

  String? validateField(String? value, dynamic fieldData) {
    if (fieldData == null) return null; // added safety
    final minLength = int.tryParse(fieldData.minLength ?? "0") ?? 0;
    final maxLength = int.tryParse(fieldData.maxLength ?? "255") ?? 255;
    final paramName = fieldData.paramName ?? "Field";

    if ((value == null || value.isEmpty) && fieldData.isOptional != "true") {
      return "$paramName is required";
    }

    if (value != null) {
      if (value.length < minLength) {
        return "$paramName must be at least $minLength characters";
      }
      if (value.length > maxLength) {
        return "$paramName must be at most $maxLength characters";
      }
    }

    return null;
  }

  Map<String, dynamic> buildInputParams() {
    final Map<String, dynamic> params = {};

    for (int i = 0; i < inpuFieldBillerData.length; i++) {
      final key = inpuFieldBillerData[i].paramName ?? "field_$i";
      final value = textControllers[i].text;

      params[key] = value;
    }

    return params;
  }

  Future<void> fetchBillerDetails() async {
    String billerId = "";
    Map<String, dynamic>? inputParams;

    // Check if a biller is selected
    if (selectedBiller != null) {
      billerId = selectedBiller!.billerId!;
    } else {
      CustomToast.show("Biller id not found");
      return;
    }

    // Build input parameters from text controllers
    if (textControllers.isNotEmpty) {
      inputParams = buildInputParams();
      if (inputParams.isEmpty) {
        CustomToast.show("Field is required");
        return;
      }
    }

    // Show loading indicator
    isLoading.value = true;

    try {
      // Prepare request model
      FastageModelbillavenueModel request = FastageModelbillavenueModel(
        biller_category: SessionManager().getServiceType(),
        inputparameter: inputParams, // dynamic type
        mobile: SessionManager().getMobile().toString(),
        billerId: billerId,
      );

      // Fetch Fastag biller response
      FetchBillBeanFastage response = await repository.fetchFastagBillDetails(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request,
      );

      // Handle response
      if (response.status == 1) {
        if (response.billResult != null) {
          SessionManager().addFastBillerDetailsData(response.billResult!);
          SessionManager().addBillerRequestId(response.requestId!);
          Get.toNamed(RoutesName.fastagBillCardScreen);
        } else {
          CustomToast.show("No biller data found");
        }
      } else {
        CustomToast.show(response.msg ?? "Failed to fetch biller details");
      }
    } catch (e) {
      CustomToast.show("Error fetching Fastag biller: $e");
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

  serviceCategory() {}
}
