import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widget/custom_appbar.dart';
import '../../res/color_palette.dart';

class RechargeCancelScreen extends StatelessWidget {
  const RechargeCancelScreen({super.key});

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
                      'Your payment request has failed',
                      textAlign: TextAlign.center,
                      style: CustomStyles.black12400,
                    ),

                    

                  

                    
                          Text(
                            'Payment could not be proceed, Please try again.',
                            style:  CustomStyles.black12400,
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
                               if (Get.key.currentState!.canPop()) {
    Get.back();
  } else {
  }
                              },
                             
                             text:   'Try again',
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
