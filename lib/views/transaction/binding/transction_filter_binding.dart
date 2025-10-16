import 'package:get/get.dart';

import '../controller/transction_filter_controller.dart';

class TransctionFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransctionFilterController>(() => TransctionFilterController());
  }
}
