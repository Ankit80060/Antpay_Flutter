import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:antpay_lite/model/place_model/company_list.dart';
import 'package:antpay_lite/model/place_model/company_type_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OccupationDetailsController extends GetxController {
  final CommonApiRepo repoClass = CommonApiRepo();

  RxList<OccupationList> occupationList = <OccupationList>[].obs;
  Rxn<OccupationList> selectedOccupation = Rxn<OccupationList>();
  var selectedCompanyType = Rxn<String>();
  var selectedCompanyName = Rxn<Company>();
  RxList<String> companyTypeList = <String>[].obs;

  var companyList = <CompanyList>[].obs;
  var selectedCompany = Rxn<CompanyList>();
  var searchController = TextEditingController();
  var companyNameList = <Company>[].obs;
  RxString currentSearchQuery = ''.obs;

  final loanAmountController = TextEditingController();
  final panNumberController = TextEditingController();
  final postalCodeController = TextEditingController();
  final ongoingLoanController = TextEditingController();
  final netMonthlySalaryController = TextEditingController();
  final TextEditingController companyNameSearchController =
      TextEditingController();

  var loanAmount = "".obs;
  var panNumber = "".obs;
  var postalCode = "".obs;
  var ongoingLoan = "".obs;
  var netMonthlySalary = "".obs;

  final salaryProcessList = ['Cheque', 'Account Transfer', 'Cash'].obs;
  final bankList = <String>[
    'HDFC Bank',
    'ICICI Bank',
    'Punjab National Bank',
    'Capital First',
    'DHFL',
    'Yes Bank',
    'Axis Bank',
    'RBL Bank',
    'TATA Capital',
    'Indiabulls',
    'State Bank Of India',
    'Shriram Finance',
    'HDB',
    'others',
  ].obs;

  var selectedSalaryProcess = RxnString();
  var selectedBank = RxnString();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initCompanyType();
    initCompanyName();

    loanAmountController
        .addListener(() => loanAmount.value = loanAmountController.text);
    panNumberController
        .addListener(() => panNumber.value = panNumberController.text);
    postalCodeController
        .addListener(() => postalCode.value = postalCodeController.text);
    ongoingLoanController
        .addListener(() => ongoingLoan.value = ongoingLoanController.text);
    netMonthlySalaryController.addListener(
        () => netMonthlySalary.value = netMonthlySalaryController.text);

    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      final passedOccupation = args['Occupation'] as String?;
      if (passedOccupation != null) {
        final matchingOccupation = occupationList.firstWhere(
          (occ) => occ.occupation == passedOccupation,
          orElse: () => OccupationList(occupation: passedOccupation),
        );
        selectedOccupation.value = matchingOccupation;
      }
    }
  }

  @override
  void dispose() {
    loanAmountController.dispose();
    panNumberController.dispose();
    postalCodeController.dispose();
    ongoingLoanController.dispose();
    netMonthlySalaryController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void setLoading(bool value) => isLoading.value = value;

  String? validateSalary(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';
    if (!RegExp(r'^[1-9]\d*$').hasMatch(value))
      return 'Please enter a valid number without leading zeros';
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) return 'Please enter a valid number';
    if (parsedValue < 1000) return 'Salary should be greater than 1000';
    if (parsedValue > 10000000) return 'Salary should be lesser than 10000000';
    return null;
  }

  initCompanyType() async {
    try {
      CompanyType response = await repoClass.p2pApiClient.getCompanyType();
      if (response.list!.isNotEmpty) {
        companyTypeList.assignAll(response.list ?? []);
      }
    } catch (e) {
      setLoading(false);
      CustomToast.show("Error fetching company types");
    }
  }

  initCompanyName() async {
    try {
      CompanyList response = await repoClass.p2pApiClient.getCompanyList();
      if (response.company_list!.isNotEmpty) {
        companyNameList.assignAll(response.company_list ?? []);
      }
    } catch (e) {
      print("Error fetching Company Name list: $e");
    }
  }

  List<Company> searchCompanyName(String query) {
    return companyNameList
        .where((company) => (company.companyName ?? '')
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }

  void clearSelection() => selectedCompanyType.value = null;

  LoanRequestModel createLoanRequestModel(
    Map<String, dynamic>? args, {
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String dob,
    required String gender,
    required String maritalStatus,
    required String qualification,
    required String state,
    required String city,
  }) {
    final loanType = args?['loanType'] ?? "Personal Loan";
    final loanName = args?['loanName']?.toString() ?? "10";
    print(
        "Submitting loan request for Loan Type: $loanType, Loan Name: $loanName, userData :$UserData(occupation: ${selectedOccupation.value?.occupation}, companyType: ${selectedCompanyType.value}, companyName: ${selectedCompanyName.value?.companyName}, modeOfSalary: ${selectedSalaryProcess.value}, bankName: ${selectedBank.value}, income: ${netMonthlySalary.value}, emi: ${ongoingLoan.value}, amount: ${loanAmount.value})");
    return LoanRequestModel(
      userData: UserData(
        loanType: loanType,
        loanName: loanName,
        state: state,
        city: city,
        gender: gender,
        dob: dob,
        maritalstatus: maritalStatus,
        nationality: "Indian",
        qualification: qualification,
        occupation: selectedOccupation.value?.occupation ?? "N/A",
        companyType: selectedCompanyType.value ?? "N/A",
        companyName: selectedCompanyName.value?.companyName ??
            "N/A",
        modeOfSalary: selectedSalaryProcess.value ?? "N/A",
        bankName: selectedBank.value ?? "N/A",
        emi: ongoingLoan.value ?? "N/A",
        income: netMonthlySalary.value ?? "",
        amount: loanAmount.value ?? "",
        appName: "AntPay",
        personalDetails: PersonalDetails(
          name: "$firstName $lastName",
          phone: mobile,
          email: email,
          pan: panNumber.value ?? "",
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
        identifiedTheCar: "",
        carBrand: "",
        carModel: "",
        carType: "",
        rto: "",
      ),
    );
  }

  Future<void> submitLoanRequest(LoanRequestModel loanRequestModel) async {
    try {
      setLoading(true);
      final response = await repoClass.apiClient.getLoanStatus1(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        loanRequestModel,
      );
      setLoading(false);
      if (response != null) {
        CustomToast.show("Loan request submitted successfully!");
        Get.toNamed(RoutesName.loanofferscreen, arguments: loanRequestModel);
      } else {
        CustomToast.show("Failed to submit loan request!");
      }
    } catch (e) {
      setLoading(false);
      CustomToast.show("Error submitting loan request: $e");
    }
  }
}
