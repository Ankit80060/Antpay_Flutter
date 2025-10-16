import 'package:antpay_lite/views/resetMpin/controller/reset_mpin_controller.dart';
import 'package:get/get.dart';


class ResetMpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResetMpinController>(ResetMpinController());
  }
} 
