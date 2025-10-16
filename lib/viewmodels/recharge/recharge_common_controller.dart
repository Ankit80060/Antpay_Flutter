// import 'package:antpay_lite/model/recharge/recharge_payment_payU_pojo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechargeCommonController extends GetxController {
  final amount = ''.obs;
  final topUpDescription = ''.obs;
  final topUpValidity = ''.obs;
  final numberController = TextEditingController().obs;
  final isLoading = false.obs;
  // var generateRechargeBean = Rxn<RechargePayUPaymentPOJO>();

  void setAmount(String value) {
    amount.value = value;
    numberController.value.text = value;
  }

  void setTopUpDescription(String description) {
    topUpDescription.value = description;
  }

  void setTopUpValidity(String validity) {
    topUpValidity.value = validity;
  }


  

  @override
  void onClose() {
    numberController.value.dispose();
    super.onClose();
  }
}
