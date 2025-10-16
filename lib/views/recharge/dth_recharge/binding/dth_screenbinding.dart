import 'package:antpay_lite/viewmodels/recharge/dth_recharge_controller/Dth_Plan_Controller.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_controller.dart';
import 'package:antpay_lite/viewmodels/recharge/recharge_common_controller.dart';
import 'package:get/get.dart';

import '../../../../viewmodels/recharge/dth_recharge_controller/dth_recharge_controller.dart';

class DthRechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DthPlanController>(() => DthPlanController());
    Get.lazyPut<RechargeCommonController>(() => RechargeCommonController());
    Get.lazyPut<DthRechargeController>(() => DthRechargeController());
    Get.lazyPut<MobileRechargeController>(() => MobileRechargeController());
  }
}
