import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widget/custom_appbar.dart';
import '../../res/color_palette.dart';
import '../../viewmodels/RechargePaymentStatusScreen/recharge_pending_controller.dart';

class PendingOrderScreen extends StatelessWidget {
  // const PendingOrderScreen({super.key});

final controller = Get.put(RechargePaymentPendingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ColorPalette.baseBackgroundColor,
        appBar: CustomAppbar(showBackIcon: false),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/pending.png',
                        width: 100,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 18),
                     Text(
                      'Your order is being processed by Company and still pending. We will SMS you on successful processing of this order. Please wait for 10-15 minutes and check message box. In case order processing is failed, your order amount will be credited to the same account.',
                      textAlign: TextAlign.center,
                      style: CustomStyles.black12400,
                    ),

                    Visibility(
                      visible: false,
                      child: Row(
                        children: const [
                          Text(
                            'Company Name',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    Visibility(
                      visible: false,
                      child: Text(
                        'Total Order',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),

                  

                    Visibility(
                      visible: true,
                      child: Row(
                        children:  [
                          Text(
                            'Reference Number:',
                            style:  CustomStyles.black12400,
                          ),
                          SizedBox(width: 5),
                          Text(
                            SessionManager().getAntTxnId()??"",
                            style: CustomStyles.black12400,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomElevatedButton(
                              onPressed: () {
                               
                                Get.offAllNamed(RoutesName.dashboard);
                              },
                              bgColor: ColorPalette.baseBackgroundColor,
                              text:  'Dispute',
                               
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomElevatedButton(
                              onPressed: () {
                                // Get.offAllNamed(RoutesName.dashboard);
                                Get.back();
                              },
                             
                             text:   'To Home',
                              ),
                            ),
                          ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
