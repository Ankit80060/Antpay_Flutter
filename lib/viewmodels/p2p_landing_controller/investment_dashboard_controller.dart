import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/p2p_lending/lender_invesstment_details_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:get/get.dart';

class InvestmentDashboardController extends GetxController {
  RxList<CurrentInvestment> currentInvestments = <CurrentInvestment>[].obs;
  RxList<PastInvestment> pastInvestments = <PastInvestment>[].obs;
  RxDouble totalInvestmentAmount = 0.0.obs;
  RxDouble totalCurrentValue = 0.0.obs;
  RxDouble totalReturn = 0.0.obs;
  RxBool isLoading = false.obs;

  Future<void> fetchInvestmentList() async {
    isLoading.value = true;
    CommonApiRepo repoClass = CommonApiRepo();
    final requestModel = LenderInvestmentDetailsRequestModel(
      lenderId: SessionManager().getLenderId(),
      phone: SessionManager().getMobile(),
      source: CustomStyles.source,
    );

    LenderInvestmentDetailsResponseModel response =
        await repoClass.lenSocialApiClient.getInvestmentDetails(
            SessionManager().getToken().toString(),
            AuthToken.getAuthToken(),
            requestModel);
    if (response.status.toString() == "1") {
      currentInvestments
          .assignAll(response.investment_details?.current_investment ?? []);
      pastInvestments.assignAll(
          (response.investment_details?.past_investment ?? [])
              .reversed
              .toList());

      totalInvestmentAmount.value =
          response.investment_details?.total_investment_amount ?? 0.0;
      totalCurrentValue.value =
          response.investment_details?.total_current_value ?? 0.0;
      totalReturn.value = response.investment_details?.total_return ?? 0.0;
    } else {
      CustomToast.show(
          'Lender Investment Details Api Fetch issue...Something Went Wrong. Try Again!');
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchInvestmentList();
  }
}
