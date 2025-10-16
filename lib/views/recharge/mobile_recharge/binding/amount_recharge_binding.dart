import 'package:antpay_lite/viewmodels/recharge/amount_recharge_controller.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_controller.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:get/get.dart';

class MobileRechargeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AmountMobileRechargeController>(
    //     () => AmountMobileRechargeController());

    Get.lazyPut<MobileRechargeController>(() => MobileRechargeController());
    Get.lazyPut<MobileRechargePlanController>(
        () => MobileRechargePlanController());
  }
}
