import 'package:get/get.dart';

import '../../viewmodels/billpay_controller/post_paid_table_controller.dart';


class PostPaidTableBinding extends Bindings {
  @override
  void dependencies() {
     Get.create(() => PostPaidTableController());
  }
}
