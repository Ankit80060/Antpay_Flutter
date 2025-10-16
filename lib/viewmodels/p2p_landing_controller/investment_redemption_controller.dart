import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentDetailsModel.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:get/get.dart';

class InvestmentRedemptionController extends GetxController {
  var dataList = <InvestmentDetailsData>[].obs;
  var isLoading = true.obs;

  String investmentNo = ""; 

  @override
  void onInit() {
    super.onInit();
    loadInvestmentDetails();
  }

  Future<void> loadInvestmentDetails() async {
    try {
      final request = InvestmentDetailsRequestModel(
        investmentNo:SessionManager().getDsinvestmentNumber()??"INVMM10000223",
        mobile: SessionManager().getMobile() ?? "8006034041",
      );

      final response = await CommonApiRepo().lenSocialApiClient.getinvestmentDetail(
        "TVRJek5EVT0=",
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        request,
      );

      if (response.status == "1") {
        dataList.assignAll(response.data ?? []);
      } else {
       CustomToast.show( "Status: ${response.status}");
      }
    } catch (e) {
      print("Error loading investment details: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
