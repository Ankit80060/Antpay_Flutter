import 'package:get/get.dart';

import '../controller/transction_limit_controller.dart';


class TransctionLimitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransctionLimitController>(() => TransctionLimitController());
  }
}
