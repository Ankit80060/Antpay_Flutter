import 'dart:convert';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/loan/Car_loan_controller/CarLoanformController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarLoanController extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();
  final CarLoanFormController controller = Get.put(CarLoanFormController());
  var loading = false.obs;
  var loanStatus = Rxn<Map<String, dynamic>>();
  RxList<OccupationList> occupationList = <OccupationList>[].obs;
  Rxn<OccupationList> selectedOccupation = Rxn<OccupationList>();

  final nameController =
      TextEditingController(text: SessionManager().getName().toString());
  final incomeController = TextEditingController();
  final contactController =
      TextEditingController(text: SessionManager().getMobile().toString());
  final panController = TextEditingController();
  final panNumberController = TextEditingController();
  var panNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchOccupations();
    final args = Get.arguments as Map<String, dynamic>?;
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  Future<void> fetchOccupations() async {
    try {
      setLoading(true);
      Occupation response = await repoClass.p2pApiClient.getOccupations();
      if (response.status == 1) {
        occupationList.assignAll(response.list ?? []);
      } else {
        CustomToast.show("Failed to fetch occupations!");
      }
    } catch (e) {
      CustomToast.show("Error fetching occupations");
    } finally {
      setLoading(false);
    }
  }

  LoanRequestModel createLoanRequestModel(Map<String, dynamic>? args) {
    final loanType = args?['loanType'] ?? "Car Loan";
    final loanName = args?['loanName']?.toString() ?? "2";
    print(
        "Submitting loan request for Loan Type: $loanType, Loan Name: $loanName");

    return LoanRequestModel(
      userData: UserData(
        loanType: loanType,
        loanName: loanName,
        state: args?["state"] ?? " ",
        gender: "",
        dob: "",
        maritalstatus: "",
        nationality: "Indian",
        qualification: "",
        occupation: selectedOccupation.value?.occupation ?? "Salaried",
        companyType: "",
        companyName: "",
        modeOfSalary: "",
        bankName: "",
        emi: "",
        income: incomeController.text,
        amount: args?['amount'] ?? "2000000",
        appName: "AntPay",
        personalDetails: PersonalDetails(
          name: nameController.text,
          phone: contactController.text,
          email: "",
          pan: panNumberController.text,
          phoneVerified: true,
          consumerBureauPullConsent: true,
          termsAccepted: true,
        ),
        auditDone: "",
        builderName: "",
        chequeBouncedInLastSixMonth: "",
        cibilScore: "",
        cin: "",
        dateOfIncorporation: "",
        defaultedOnLoanCard: "",
        industryType: "",
        officePhoneNumber: "",
        ownerShip: "",
        propertyType: "",
        propertyValue: "",
        ratedByFinancialAgency: "",
        locationOfPropertyPincode: "",
        professionType: "",
        netWorth: "",
        totalExperience: "",
        turnover1: "",
        turnover2: "",
        turnover3: "",
        identifiedTheCar: args?['identifiedTheCar'] ?? "",
        carBrand: controller.selectedBrand.value,
        carModel: controller.selectedModel.value,
        carType: args?['carType'] ?? "",
        rto: args?['rto'] ?? "",
      ),
    );
  }

  Future<void> submitLoanRequest(LoanRequestModel loanRequestModel) async {
    try {
      setLoading(true);
      final aParam = AppConstant.generateAuthParam(
        SessionManager().getMobile().toString(),
      );
      loanRequestModel.aParam = aParam;
      final response = await repoClass.apiClient.getCarLoanStatus(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        loanRequestModel,
      );
      final map = jsonDecode(response); // -> Map<String, dynamic>
      if (map['status'] == 1) {
        CustomToast.show(map['message'] ?? 'Applied successfully');
        Get.toNamed(RoutesName.loanofferscreen, arguments: loanRequestModel);
      } else {
        CustomToast.show('Submission failed');
      }
    } catch (e) {
      loading(false);
      CustomToast.show('Error : $e');
    } finally {
      loading(false);
    }
  }

  Future<void> submitForm(LoanRequestModel data) async {
    final loanRequestModel =
        createLoanRequestModel(Get.arguments as Map<String, dynamic>?);
    await submitLoanRequest(loanRequestModel);
  }
}
