import 'package:get/get.dart';

import '../../viewmodels/billpay_controller/biller_table_controller.dart';

class BillerTableBinding extends Bindings {
  @override
  void dependencies() {
     Get.create(() => BillerTableController());
  }
}

