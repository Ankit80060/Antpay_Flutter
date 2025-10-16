import 'package:get/get.dart';

import '../../../viewmodels/recharge/ncmc_recharge_controller/ncmc_metro_recharge_controller.dart';


class NcmcTableBinding extends Bindings {
  @override
  void dependencies() {
     Get.create(() => NcmcRechargeController());
  }
}
