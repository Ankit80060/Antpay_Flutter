import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/billpay/GetCategoriesBean.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/billpay_repository/billpay_repo.dart';
import 'package:get/get.dart';

import '../../utils/routes/routes_name.dart';

class BillPayController extends GetxController {
  var isLoading = false.obs;
  var categoryList = <results>[].obs;

  RxString coinsBalance = "0".obs;

  RxString walletBalance = "0.0".obs;
  get billerController => null;

  @override
  void onInit() {
    super.onInit();
    coinsBalance.value = SessionManager().getAntCoinsMoney() ?? "0.0";
    walletBalance.value = SessionManager().getUserAccountBalance() ?? "0.0";
    fetchCategory();
  }

  Future<List<results>> fetchCategory() async {
    isLoading(true);
    try {
      final authToken = AuthToken.getAuthToken();
      final oauthToken = SessionManager().getToken()?.toString() ?? '';

      if (authToken.isEmpty || oauthToken.isEmpty) {
        Get.snackbar('Error', 'Authentication tokens are missing');
        return categoryList;
      }

      BillPayRepo commonApiRepo = BillPayRepo();
      SchemesInvestmentResonseModel response = await commonApiRepo.getCategory(
        authToken,
        oauthToken,
      );

    
      if (response.schemesList != null) {
        categoryList.assignAll(response.schemesList!);
        for (results result in categoryList) {
          }
      }
      return categoryList;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories: $e');
      return categoryList;
    } finally {
      isLoading(false);
    }
  }

  handelCardClick() {
    Get.toNamed(RoutesName.coinPage);
  }

  Future<void> handleCategoryTap(String? serviceName) async {
    if (serviceName == null) {
      CustomToast.show('Service name is null');
      return;
    }

    if (serviceName == "LPG") {
      serviceName = "LPG GAS";
    }

    SessionManager().addServicetype(serviceName);
    SessionManager().addFromScreen('allbillpay');

    if (serviceName == "PostPaid") {
      Get.toNamed(RoutesName.postPaidFragmentScreen);
    } else if (serviceName == "NCMC Recharge") {
      Get.toNamed(
                                RoutesName.ncmcmetrorechargescreen,
                                arguments: "NCMC Recharge",
                              );
    } else {
      Get.toNamed(RoutesName.bharatBillPayTemplateView);
    }
  }
}
