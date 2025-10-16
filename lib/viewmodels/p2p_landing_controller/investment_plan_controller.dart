import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/full_kyc/verify_full_kyc_model.dart';
import 'package:antpay_lite/model/p2p_lending/scheme_investment_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/views/p2p_lending/investment_ammount_screen.dart';
import 'package:antpay_lite/views/p2p_lending/investment_form.dart';
import 'package:get/get.dart';

class InvestmentPlanController extends GetxController {
  CommonApiRepo repoClass=CommonApiRepo();
  RxList<Schemes> schemesList = <Schemes>[].obs;
  RxBool isLoading = false.obs;
Rx<KycStatus?> kycData = Rx<KycStatus?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchInvestmentSchemes();
  }

Future<void> fetchInvestmentSchemes() async {
  try {
    isLoading.value = true;

   SchemesInvestmentResponseModel response = await repoClass.lenSocialApiClient.getInvestmentSchemes(
     "TVRJek5EVT0=",  
     AuthToken.getAuthToken(),         
     SessionManager().getToken().toString(),
   );

    if (response.status.toString() == '1') {
      schemesList.assignAll(response.schemesList ?? []);
      kycData.value = response.kyc_status;
    } else {
      schemesList.clear(); 
      CustomToast.show('Failed to fetch schemes. Please try again.');
    }

  } catch (e) {
    CustomToast.show('Error: ${e.toString()}');
  } finally {
    isLoading.value = false;
  }
}


  // Future<void> investButtonClick() async {
  //   LenderKycStatusRequestModel data = LenderKycStatusRequestModel(
  //     phone: SessionManager().getMobile(),
  //     source: CustomStyles.source,
  //   );

  //   LenderKycStatusResponseModel kycResp =
  //       await _investmentViewModel.checkLenderKycStatus(Get.context!, data);

  //   if (kycResp.kyc_status?.step.toString() == '0') {
  //     Get.toNamed(RoutesName.personal_investment_kyc);
  //   } else {
  //     Get.toNamed(RoutesName.investment_dashboard);
  //   }
  // }

  Future<void> checkFullKycStatusAndProceed() async {
    VerifyFullKycRequest req = VerifyFullKycRequest(
      mobile: SessionManager().getMobile(),
      userType: CustomStyles.user_type_lender,
      validateXml: true,
    );

   VerifyFullKycResponse resp = await repoClass.lenSocialApiClient.fullKYCStatus(SessionManager().getCustomToken().toString(),
            'NTk0MDcxOmJhMjUzZTM4ZmM0NDBkMjQ4Yjk1NWRmOGYzMzZmNzRl',req);


    if (resp.status.toString() == '1') {
      KYCResponse? kycResp = resp.response;
      AadharKyc? a = kycResp?.aadharKyc;
      PanKyc? p = kycResp?.panKyc;
      BankKyc? b = kycResp?.bankKyc;
      KycUserDetails? ud = kycResp?.kycUserDetails;

      if (a?.status.toString() == '0' &&
          p?.status.toString() == '1' &&
          b?.status.toString() == '1') {
        SessionManager().addLenderId(ud!.userId.toString());
        Get.to(()=>InvestmentAmountView());
      } else {
     
      Get.off(()=>InvestmentKycForm());
      }
    } else {
   
       Get.off(()=>InvestmentKycForm());
    }
  }
}
