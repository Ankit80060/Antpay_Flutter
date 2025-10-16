import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessLoanFormController extends GetxController {
  final CommonApiRepo repoClass = CommonApiRepo();

  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final loanAmountController = TextEditingController();
  final netMonthlySalaryController = TextEditingController();
  final ongoingLoanController = TextEditingController();
  final panNumberController = TextEditingController();
  final postalCodeController = TextEditingController();

  final loanAmount = ''.obs;
  final netMonthlySalary = ''.obs;
  final ongoingLoan = ''.obs;
  final panNumber = ''.obs;
  final postalCode = ''.obs;
  final selectedSalaryProcess = ''.obs;
  final selectedBank = ''.obs;

  final salaryProcessList = ['Account Transfer', 'Cash', 'Cheque'].obs;
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

  Map<String, dynamic>? previousData;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is Map) {
      previousData = (Get.arguments as Map).cast<String, dynamic>();
      print("BusinessLoanFormController args: $previousData");
    } else {
      print("No valid arguments received");
    }
  }

  Future<void> submitLoanRequest(LoanRequestModel loanRequestModel) async {
    try {
      isLoading.value = true;
      print("Submitting LoanRequestModel: ${loanRequestModel.toJson()}");
      final response = await repoClass.apiClient.getLoanStatus1(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        loanRequestModel,
      );
      print("API Response: $response");
      Get.toNamed(
        RoutesName.loanhomescreen,
        arguments: {
          'loanRequestModel': loanRequestModel,
          'image': previousData?['image']?.toString() ??
              'assets/images/ic_business_loan.png',
        },
      );
    } catch (e, s) {
      print(" Error in submitLoanRequest: $e");
      print("StackTrace: $s");
      Get.snackbar("Error", "Failed to submit loan request: $e");
    } finally {
      isLoading.value = false;
    }
  }

  LoanRequestModel createLoanRequestModel() {
    return LoanRequestModel(
      userData: UserData(
        loanType: previousData?['loanType']?.toString() ?? '',
        loanName: previousData?['loanName']?.toString() ?? '',
        state: previousData?['state']?.toString() ?? '',
        city: previousData?['city']?.toString() ?? '',
        gender: previousData?['gender']?.toString() ?? '',
        dob: previousData?['dateOfBirth']?.toString() ?? '',
        maritalstatus: previousData?['maritalStatus']?.toString() ?? '',
        nationality: 'Indian',
        qualification: previousData?['qualification']?.toString() ?? '',
        occupation: previousData?['occupation']?.toString() ?? '',
        companyType: '',
        companyName: '',
        modeOfSalary: selectedSalaryProcess.value,
        bankName: selectedBank.value,
        emi: ongoingLoanController.text,
        professionType: previousData?['professionType']?.toString() ?? '',
        totalExperience: previousData?['totalExperience']?.toString() ?? '',
        turnover1: previousData?['grossTurnover']?.toString() ?? '',
        turnover2: previousData?['grossTurnover2']?.toString() ?? '',
        turnover3: previousData?['grossTurnover3']?.toString() ?? '',
        ownerShip: previousData?['officeOwnership']?.toString() ?? '',
        auditDone: previousData?['auditDone']?.toString() ?? '',
        defaultedOnLoanCard: previousData?['defaultedOnLoan']?.toString() ?? '',
        industryType: previousData?['industryType']?.toString() ?? '',
        officePhoneNumber: previousData?['officePhoneNumber']?.toString() ?? '',
        amount: loanAmountController.text,
        propertyType: '',
        dateOfIncorporation: '',
        cin: previousData?['cin']?.toString() ?? '',
        chequeBouncedInLastSixMonth:
            previousData?['checkBounced']?.toString() ?? '',
        ratedByFinancialAgency:
            previousData?['companyRatedByAgency']?.toString() ?? '',
        cibilScore: '',
        propertyValue: '',
        netWorth: previousData?['netWorth']?.toString() ?? '',
        locationOfPropertyPincode: postalCodeController.text,
        builderName: '',
        appName: 'AntPay',
        personalDetails: PersonalDetails(
          name:
              '${previousData?['firstName']?.toString() ?? ''} ${previousData?['lastName']?.toString() ?? ''}',
          email: previousData?['email']?.toString() ?? '',
          phone: previousData?['mobile']?.toString() ?? '',
          phoneVerified: true,
          consumerBureauPullConsent: true,
          termsAccepted: true,
          pan: panNumberController.text,
        ),
        min_rate: '',
        min_loan_amount: '',
      ),
    );
  }

  String? validateSalary(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'Please enter a valid number';
    }
    if (parsedValue < 5000) {
      return 'Salary should be greater than 5000';
    }
    return null;
  }

  @override
  void onClose() {
    loanAmountController.dispose();
    netMonthlySalaryController.dispose();
    ongoingLoanController.dispose();
    panNumberController.dispose();
    postalCodeController.dispose();
    super.onClose();
  }
}
