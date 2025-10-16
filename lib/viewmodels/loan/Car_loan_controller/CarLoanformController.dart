import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/loan_model/BrandModel.dart';
import 'package:antpay_lite/model/loan_model/RTO.dart';
import 'package:antpay_lite/model/loan_model/VechileModel.dart';
import 'package:antpay_lite/model/loan_model/state_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarLoanFormController extends GetxController {
  final CommonApiRepo repoClass = CommonApiRepo();

  final loanRequirementController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();

  RxList<String> brandList = <String>[].obs;
  RxList<String> brandModelList = <String>[].obs;
  RxList<String> rtoList = <String>[].obs;
  RxnString selectedRto = RxnString();

  var loanAmount = "".obs;
  var selectedBrand = ''.obs;
  var selectedModel = ''.obs;

  RxList<StateData> stateList = <StateData>[].obs;
  Rxn<StateData> selectedState = Rxn<StateData>();

  RxBool isCarIdentified = true.obs;
  RxBool isNewCar = true.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    loanRequirementController
        .addListener(() => loanAmount.value = loanRequirementController.text);
    super.onInit();
    _initBrand();
    getStatesForCar();
  }

  Future<List<String>> searchBrand(String query) async {
    return brandList
        .where((b) => b.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<String>> searchModel(String query) async {
    return brandModelList
        .where((m) => m.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> _initBrand() async {
    loading.value = true;
    try {
      final BrandModel response = await repoClass.apiClient.getBrands();
      brandList.assignAll(
          response.brands?.map((b) => b.manufacturer ?? '').toList() ?? []);
    } catch (e) {
      CustomToast.show("Error");
    } finally {
      loading.value = false;
    }
  }

  Future<void> getStatesForCar() async {
    loading.value = true;
    try {
      final StateResponse response =
          await repoClass.apiClient.getStatesForCar();
      if (response.status == 1) {
        stateList.assignAll(response.data);
        selectedState.value = null;
        selectedRto.value = null;
        rtoList.clear();
      } else {
        print("Failed to fetch states: ${response.message}");
        stateList.clear();
      }
    } catch (e) {
      print("Error fetching states: $e");
      stateList.clear();
      selectedState.value = null;
      selectedRto.value = null;
      rtoList.clear();
    } finally {
      loading.value = false;
    }
  }

  Future<void> onStateSelected(String stateCode) async {
    selectedState.value =
        stateList.firstWhere((s) => s.numStateCd == stateCode);
    selectedRto.value = null;
    rtoList.clear();
    await getRTOFromStates(stateCode);
  }

  Future<void> initBrandModel(String manufacturer) async {
    loading.value = true;
    try {
      VehcileData response =
          await repoClass.apiClient.getMotorModelBrand(manufacturer);
      brandModelList.assignAll(
          response.models.map((b) => b.vehiclemodelVariante).toList());
    } finally {
      loading.value = false;
    }
  }

  Future<void> getRTOFromStates(String stateCode) async {
    loading.value = true;
    try {
      final RtoResponse response =
          await repoClass.apiClient.getRTOFromStates(stateCode);
      if (response.status == 1 && response.data != null) {
        rtoList.assignAll(
            response.data.map((e) => e.registrationStateCity).toSet().toList());
        selectedRto.value = null;
      } else {
        rtoList.clear();
        selectedRto.value = null;
      }
    } catch (e) {
      rtoList.clear();
      selectedRto.value = null;
    } finally {
      loading.value = false;
    }
  }

  String? validateForm() {
    if (isCarIdentified.value) {
      if (selectedBrand.value.isEmpty || brandController.text.isEmpty) {
        return "Car Brand is required";
      }
      if (selectedModel.value.isEmpty || modelController.text.isEmpty) {
        return "Car Model is required";
      }
    }
    return null;
  }
}
