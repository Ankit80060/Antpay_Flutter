import 'package:get/get.dart';
import '../../prefrences/session_manager.dart';
import '../../utils/routes/routes_name.dart';

class RechargeFailController extends GetxController {
  // Order data fetch from session
  var orderData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    orderData.value = SessionManager().getGenerateOrderResponse();
    Future.delayed(const Duration(seconds: 3), () {
      // redirectToDashboard();
    });
  }

  // Navigate to Dashboard
  void redirectToDashboard() {
    Get.offAllNamed(RoutesName.dashboard);
  }
}
