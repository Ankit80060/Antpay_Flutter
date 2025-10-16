import 'package:get/get.dart';

import '../../../../viewmodels/recharge/amount_recharge_controller.dart';

class AmountRechargeBinding extends Bindings {
  @override
  void dependencies() {
       Get.put(AmountMobileRechargeController());
    // Get.create(() => AmountMobileRechargeController());
       
    // Get.put<AmountMobileRechargeController>(AmountMobileRechargeController());
//     Get.put<AmountMobileRechargeController>(
//   () => AmountMobileRechargeController()
  
// );

  }
}
