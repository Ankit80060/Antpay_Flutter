import 'package:antpay_lite/api/comman_api_repo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountTransferController extends GetxController {
  final formKey = GlobalKey<FormState>();
  CommonApiRepo repoClass = CommonApiRepo();
  final amountController = TextEditingController();
  final remarkController = TextEditingController();

  RxString walletBalance = "0.00".obs;

  @override
  void onClose() {
     if (Get.isRegistered<AccountTransferController>()) {
      Get.delete<AccountTransferController>();
    }
    amountController.dispose();
    remarkController.dispose();
    super.onClose();
  }

 
}
