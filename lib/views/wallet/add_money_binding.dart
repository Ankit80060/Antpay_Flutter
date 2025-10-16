import 'package:get/get.dart';

import '../../viewmodels/wallet_controller.dart/add_money_controller.dart';


class AddMoneyViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => AddMoneyViewController());
       
    

  }
}
