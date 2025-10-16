import 'package:get/get.dart';

import '../../../viewmodels/recharge/fastag_recharg_controller/fastag_billcard_controller.dart';

class FastagBillCardBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the controller
    Get.create<FastagBillCardController>(() => FastagBillCardController());

    // Get.create<FastagBillCardController>(() => FastagBillCardController());
  }
}
