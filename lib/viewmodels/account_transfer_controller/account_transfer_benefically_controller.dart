import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_fetch_beneficiary.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountTransferBeneficaillyController extends GetxController {
  var selectedType = 'Family'.obs;
  final types = ["Family", "Friend", "Others"];
  TextEditingController searchController=TextEditingController();

  var hasRecords = true.obs;
  var isScreenLoading = true.obs;

  var beneficiaryList = <BeneficiaryData>[].obs;
  var filteredBeneficiaryList = <BeneficiaryData>[].obs;

  late CustomerFetchBeneficiaryResponse beneficiaryResponse;
  CommonApiRepo repoclass = CommonApiRepo();

  @override
  void onInit() {
    super.onInit();
   loadData();
  }

  Future<void> loadData() async {
    try {
      isScreenLoading.value = true;
      CustomerFetchBeneficiaryRequest request = CustomerFetchBeneficiaryRequest(
        activationStatus: "ALL",
        clientTxnId: "",
        messageCode: "",
        requestDateTime: "",
        urn: 1003031,
        transferType: "FT",
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      );
      beneficiaryResponse = await repoclass.apiClient.CustomerFetchBeneficiary(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          request);
print("beneficiaryResponse$beneficiaryResponse");
      if (beneficiaryResponse.beneficiaryDataList != null) {
        SessionManager()
            .addCustomerId(beneficiaryResponse.customerId.toString());
        beneficiaryList
            .assignAll(beneficiaryResponse.beneficiaryDataList ?? []);
        filteredBeneficiaryList.assignAll(beneficiaryList);
      }
    } catch (e) {
      hasRecords.value = false;
    } finally {
      isScreenLoading.value = false;
    }
  }

  void filterBeneficiaries(String query) {
    if (query.isEmpty) {
      filteredBeneficiaryList.assignAll(beneficiaryList);
    } else {
      filteredBeneficiaryList.assignAll(
        beneficiaryList.where((beneficiary) {
          final name = beneficiary.beneficiaryName?.toLowerCase() ?? '';
          final account = beneficiary.bankAccountNumber?.toLowerCase() ?? '';
          return name.contains(query.toLowerCase()) ||
              account.contains(query.toLowerCase());
        }).toList(),
      );
    }}


  send2FAOtp(String action) async {
  try {

      var response = await repoclass.send2FAOtp({
        "customerMobile": SessionManager().getMobile().toString(),
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString())
      }, action);

    if (response.responseCode.toString() == "00") {
      switch (action) {
        case "SET":
          Get.toNamed(RoutesName.resetMpin, arguments: "SET");
          break;
        case "RESET":
          Get.toNamed(RoutesName.resetMpin, arguments: "RESET");
          break;
        case "VERIFY":
          Get.toNamed(RoutesName.resetMpin, arguments: "VERIFY");
          break;
        case "FORGOT":
          Get.toNamed(RoutesName.resetMpin, arguments: "FORGOT");
          break;
      }
    } else {
      CustomToast.show(response.responseMessage);
    }
  } catch (e) {
     CustomToast.show("Something went wrong!");
    debugPrint(e.toString());
  } finally {
 
  }
  return null;
}

}
