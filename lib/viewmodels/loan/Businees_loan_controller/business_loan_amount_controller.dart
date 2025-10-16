import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessLoanController extends GetxController {
  final loanAmountController = TextEditingController();
  final panNumberController = TextEditingController();
  final postalCodeController = TextEditingController();

  var loanAmount = "".obs;
  var panNumber = "".obs;
  var postalCode = "".obs;
}
