import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/recharge_model/fetchplan_list_dth_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/recharge_repository/mobilerecharge_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:get/get.dart';

class DthPlanController extends GetxController {
  final loading = false.obs;
  final data3g4g = <Datalist>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDthPlans();
  }

  Future<void> fetchDthPlans() async {
    loading.value = true;
    try {
      final requestData = fetchPlanRequestModeldth(
        circle: SessionManager().getValue() ?? '42',
        operator: SessionManager().getOperatorCode() ?? '91',
        type: 'dth',
        aParam:
            AppConstant.generateAuthParam(SessionManager().getMobile() ?? ''),
      );

      final response = await fetchplanindth(requestData);
      final data = response.dataplan;

      if (data != null && data.datalistdthaplan != null) {
        // Filter out plans with null rs or rs.months1
        final validPlans = data.datalistdthaplan!
            .where((plan) => plan.rs != null && plan.rs!.months1 != null)
            .toList();
        data3g4g.assignAll(validPlans);
       
      } else {
        data3g4g.clear();
      }
    } catch (e) {
      CustomToast.show("Error fetching plans: $e");
      data3g4g.clear();
    } finally {
      loading.value = false;
    }
  }

  Future<fetchplan_list_dth_model> fetchplanindth(
      fetchPlanRequestModeldth data) async {
    final repoClass = MobileRechargeRepo();
    final token = SessionManager().getToken() ?? '';
    if (token.isEmpty) {
      CustomToast.show("Session expired. Please log in again");
      Get.offNamed('/login'); // Adjust to your RoutesName.loginScreen
      throw Exception("No valid token available");
    }

    try {
      final response = await repoClass.fetchplanapidth(
        data,
        AuthToken.getAuthToken(),
        token,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch DTH plans: $e');
    }
  }


}
