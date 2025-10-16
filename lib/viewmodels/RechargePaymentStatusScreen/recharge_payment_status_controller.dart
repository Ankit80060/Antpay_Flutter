import 'package:get/get.dart';
import '../../utils/routes/routes_name.dart';

class RechargePaymentStatusController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      // redirectToDashboard();
    });
  }

  void redirectToDashboard() {
    // Get.toNamed(RoutesName.amountrechargescreen,arguments: {
    //      "fromPage" :"FromMobileRecharge"
    //     });

    Get.offAllNamed(RoutesName.dashboard
    );
  }
}
