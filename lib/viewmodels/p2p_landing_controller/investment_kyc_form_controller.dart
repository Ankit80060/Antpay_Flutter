import 'dart:io';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/full_kyc/full_kyc_model.dart';
import 'package:antpay_lite/model/full_kyc/verify_full_kyc_model.dart';
import 'package:antpay_lite/model/place_model/bank_list_model.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/company_list.dart';
import 'package:antpay_lite/model/place_model/company_type_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/model/place_model/qualification_model.dart';
import 'package:antpay_lite/model/place_model/state_code_request.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/views/p2p_lending/investment_payment_succefully_failed.dart';
import 'package:antpay_lite/views/p2p_lending/investment_succesfully_failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvestmentKYCFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  CommonApiRepo repoClass = CommonApiRepo();

  var isLoading = true.obs;
  var currentStep = 0.obs;
  var selectedGender = ''.obs;
  var selectedDob = ''.obs;
  var selectedState = Rxn<StateList>();
  var selectedCity = Rxn<City>();
  var selectedOccupation = Rxn<OccupationList>();
  var selectedQualification = Rxn<QualificationList>();
  var selectedCompanyType = Rxn<String>();
  var selectedCompanyName = Rxn<Company>();
  var selectedAnnualIncome = Rxn<String>();
  var selectedbankName = Rxn<BankList>();
  var cityList = <City>[].obs;
  var stateList = <StateList>[].obs;
  var occupationList = <OccupationList>[].obs;
  var companyTypeList = <String>[].obs;
  var companyNameList = <Company>[].obs;
  var qualificationList = <QualificationList>[].obs;
  var bankList = <BankList>[].obs;
  late Map mobileCheckData = SessionManager().getFullKycTypeDetails();

  final genderList = [
    'Male',
    'Female',
  ];

  final aadhaarController = TextEditingController();
  final panController = TextEditingController();
  final firstNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final pincodeController = TextEditingController();
  final annualIncomeController = TextEditingController();
  final dobController = TextEditingController();
  final accountNumberController = TextEditingController();
  final reEnterAccountNumberController = TextEditingController();
  final ifscCodeController = TextEditingController();

  final TextEditingController stateSearchController = TextEditingController();
  final TextEditingController citySearchController = TextEditingController();
  final TextEditingController occupationSearchController =
      TextEditingController();
  final TextEditingController qualificationSearchController =
      TextEditingController();
  final TextEditingController companyTypeSearchController =
      TextEditingController();
  final TextEditingController companyNameSearchController =
      TextEditingController();
  final TextEditingController searchBnakNameSearchController =
      TextEditingController();

  List<StateList> searchState(String query) {
    return stateList
        .where((state) =>
            (state.state ?? '').toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<City> searchCity(String query) {
    return cityList
        .where((city) =>
            (city.cityName ?? '').toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<OccupationList> searchOccupation(String query) {
    return occupationList
        .where((occupation) => (occupation.occupation ?? '')
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }

  List<QualificationList> searchQualification(String query) {
    return qualificationList
        .where((q) =>
            (q.qualification ?? '').toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<String> searchCompanyType(String query) {
    return companyTypeList
        .where((type) => type.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Company> searchCompanyName(String query) {
    return companyNameList
        .where((company) => (company.companyName ?? '')
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }

  List<BankList> searchBankName(String query) {
    return bankList
        .where((bank) =>
            (bank.name ?? '').toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  fetchStateList() async {
    try {
      StateModel response = await repoClass.p2pApiClient.getStateList();

      if (response.status == 1) {
        stateList.assignAll(response.stateList ?? []);
        print("STATE API RESPONSE LENGTH: ${response.stateList?.length}");
      }
    } catch (e) {
      print("Error fetching state list: $e");
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
      print("Error fetching city list: $e");
    }
  }

  initOccupations() async {
    try {
      Occupation response = await repoClass.p2pApiClient.getOccupations();
      if (response.status == 1) {
        occupationList.assignAll(response.list ?? []);
      }
    } catch (e) {
      print("Error fetching Occupation list: $e");
    }
  }

  initQualifications() async {
    try {
      Qualification response = await repoClass.p2pApiClient.getQualifications();
      if (response.status == 1) {
        qualificationList.assignAll(response.list ?? []);
      }
    } catch (e) {
      print("Error fetching Qualification list: $e");
    }
  }

  initCompanyType() async {
    try {
      CompanyType response = await repoClass.p2pApiClient.getCompanyType();
      if (response.list!.isNotEmpty) {
        companyTypeList.assignAll(response.list ?? []);
      }
    } catch (e) {
      print("Error fetching CompanyType list: $e");
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

  initBankList() async {
    try {
      Banks response = await repoClass.p2pApiClient.getBankList();
      if (response.status == 1) {
        bankList.assignAll(response.list ?? []);
      }
    } catch (e) {
      print("Error fetching Bank list: $e");
    }
  }

  submitFullKycStatusAndProceed() async {
    FullKycRequest req = FullKycRequest(
        fullName: firstNameController.text,
        email: emailController.text,
        mobile: SessionManager().getMobile(),
        aadhar: aadhaarController.text,
        pan: panController.text,
        dob: dobController.text,
        gender: selectedGender.value,
        r_pincode: pincodeController.text,
        r_state: selectedState.value?.code ?? '',
        r_city: selectedCity.value?.stateCode ?? '',
        net_monthly_income: annualIncomeController.text,
        occuption_id: selectedOccupation.value?.id,
        company_type: selectedCompanyType.value,
        company_name: selectedCompanyName.value?.companyName,
        company_code: selectedCompanyName.value?.id,
        highest_qualification: selectedQualification.value?.id,
        accountNo: accountNumberController.text,
        cAccountNo: accountNumberController.text,
        bankName: selectedbankName.value?.id,
        ifsc: ifscCodeController.text,
        userType: "lender",
        source: CustomStyles.source,
        product: "Surge");

    KYCResponse response = await repoClass.lenSocialApiClient.fullKYC(
        SessionManager().getToken().toString(),
        'NTk0MDcxOmJhMjUzZTM4ZmM0NDBkMjQ4Yjk1NWRmOGYzMzZmNzRl',
        req);

    PanKyc? panKyc = response.panKyc;
    BankKyc? bankKyc = response.bankKyc;
    KycUserDetails? ud = response.kycUserDetails;

    if (panKyc?.status == "Active" && bankKyc?.status == 1) {
      Get.to(
        () => InvestmentSuccesfullyFailedScreen(),
        arguments: {
          "isSuccess": "Your KYC is Verified Successfully",
        },
      );
    } else {
      Get.to(
        () => InvestmentSuccesfullyFailedScreen(),
        arguments: {
          "isSuccess": "We could not verify your KYC details",
        },
      );
    }
  }

  void initializeData() async {
    isLoading.value = true;

    try {
      await Future.wait<void>([
        // initBankList(),
      ]);
    } catch (e) {
      CustomToast.show("Initialization failed: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    final session = SessionManager();
    final name = session.getName();
    if (name != null && name.isNotEmpty) {
      firstNameController.text = name;
    }

    final email = session.getUserEmail();
    if (email != null && email.isNotEmpty) {
      emailController.text = email;
    }

    final mobile = session.getMobile();
    if (mobile != null && mobile.isNotEmpty) {
      mobileController.text = mobile;
    }

    if (email != null && email.isNotEmpty) {
      emailController.text = email;
    }
    selectedGender.value = session.getUserGender() == "0" ? "Male" : "Female";

    dobController.text = session.getUserDOB() ?? "";

    fetchStateList();
    initOccupations();
    initQualifications();
    initCompanyType();
    initCompanyName();
  }

  @override
  void onClose() {
    aadhaarController.dispose();
    panController.dispose();
    firstNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    pincodeController.dispose();

    dobController.dispose();
    annualIncomeController.dispose();
    stateSearchController.dispose();
    citySearchController.dispose();
    occupationSearchController.dispose();
    qualificationSearchController.dispose();
    companyTypeSearchController.dispose();
    companyNameSearchController.dispose();
    searchBnakNameSearchController.dispose();

    super.onClose();
  }
}
