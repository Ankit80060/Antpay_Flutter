
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/p2p_lending/social_payment_generate_order_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../utils/common_utils.dart';

class InvestmentAmountController extends GetxController {
  final TextEditingController investAmountController = TextEditingController();
  final isChecked = true.obs;
  final isLoading = false.obs;
   var selectedIndex = (-1).obs;
        late TapGestureRecognizer tapGestureRecogniserTC;
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tapGestureRecogniserTC = TapGestureRecognizer()
      ..onTap = () {
                 CustomUrlLauncher.openUrl(
         
          'https://www.antworksp2p.com/Term_and_conditions_surge',
        );
      };

  }
  @override
  void dispose() {
    // TODO: implement dispose
    investAmountController.dispose();
    super.dispose();
  }


 
}
