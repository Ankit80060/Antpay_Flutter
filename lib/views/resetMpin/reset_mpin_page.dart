import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/resetMpin/controller/reset_mpin_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../res/color_palette.dart';

class ResetMpinScreen extends StatelessWidget {
  final controller = Get.find<ResetMpinController>();

  ResetMpinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body:
      Stack( children: [ SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
             physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: AppColors.bgcolor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset(
            'assets/images/antpay_logo.png',
            scale: 1.2,
          ),
                    // Text.rich(
                    //   TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: "Ant",
                    //         style: CustomStyles.black20500.copyWith(
                    //           fontSize: 34.0,
                    //           color: AppColors.dblue,
                    //           fontStyle: FontStyle.italic,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: "Pay",
                    //         style: CustomStyles.black20500.copyWith(
                    //           fontSize: 34.0,
                    //           color: Colors.red,
                    //           fontStyle: FontStyle.italic,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                   
                    SizedBox(height: 40),
                    Text(
                      "Experience New Age Financial\nServices at AntPay",
                      textAlign: TextAlign.center,
                      style:
                          CustomStyles.black14500.copyWith(color: AppColors.dblue),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.27,
                left: 10,right: 10,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Obx(() =>  Center(
                        child:  Text(
                         controller.actionStatus.value=='SET'? 'Create your MPIN':controller.actionStatus.value=='FORGOT'?"Forgot your MPIN ": "Reset your MPIN",
                          style: CustomStyles.black18400,
                        ),
                      ),),
                      const SizedBox(height: 20),
                      Text(
                        "Enter OTP",
                        style: CustomStyles.black12400,
                      ),
                      Pinput(
                        length: 6,
                        keyboardType: TextInputType.number,
                        controller: controller.otpController,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.next,
                        showCursor: true,
                        autofocus: false,
                        obscureText: true,
                        onCompleted: null,
                        defaultPinTheme: PinTheme(
                          width: 40,
                          height: 35,
                          textStyle: CustomStyles.black14500,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                               color: Colors.grey,
                                  width: 1), 
                            ),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 40,
                          height: 35,
                          textStyle: CustomStyles.black14500
                              .copyWith(color: AppColors.black54),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.red,
                                  width: 1), 
                            ),
                          ),
                        ),
                      ),
              
                      SizedBox(
                        height: 10.0,
                      ),
                     Obx(() =>  Text(
                       controller.actionStatus.value=='SET' || controller.actionStatus.value=='FORGOT'?"Enter New MPIN": "Enter Old MPIN",
                        style: CustomStyles.black12400,
                      ),),
              
                      Pinput(
                        length: 6,
                        keyboardType: TextInputType.number,
                        controller: controller.oldMpinController,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.next,
                        showCursor: true,
                        autofocus: false,
                        obscureText: true,
                        onCompleted: null,
                        defaultPinTheme: PinTheme(
                          width: 40,
                          height: 35,
                          textStyle: CustomStyles.black14500
                              .copyWith(color: AppColors.black54),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                 color: Colors.grey,
                                  width: 1), // 🔹 underline
                            ),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 40,
                          height: 35,
                          textStyle: CustomStyles.black14500
                              .copyWith(color: AppColors.black54),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                   color: Colors.red,
                                  width: 1), // 🔹 focused underline
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                     Obx(() =>  Text(
                       controller.actionStatus.value=='SET' || controller.actionStatus.value=='FORGOT'?"Confirm MPIN": "Enter New MPIN",
                        style: CustomStyles.black12400,
                      ),),
              
                      Pinput(
                        length: 6,
                        keyboardType: TextInputType.number,
                        controller: controller.newMpinController,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.next,
                        showCursor: true,
                        autofocus: false,
                        obscureText: true,
                        onCompleted: null,
                        defaultPinTheme: PinTheme(
                          width: 40,
                          height: 35,
                          textStyle: CustomStyles.black14500
                              .copyWith(color: AppColors.black54),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1), 
                            ),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 40,
                          height: 35,
                          textStyle: CustomStyles.black14500
                              .copyWith(color: AppColors.black54),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.red,
                                  width: 1), // 🔹 focused underline
                            ),
                          ),
                        ),
                      ),
              
                      const SizedBox(height: 15),
                      Obx(() {
                        if (controller.actionStatus.value=='RESET') {
                          return Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                controller.clickForgotMpin();
                              },
                              child: Text(
                                'Forgot MPIN?',
                                style: CustomStyles.black12400.copyWith(color: Colors.red, ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      // Timer
                      Obx(() {
                       if (!controller.showResendText.value && controller.secondsLeft.value>0) {
                final min =
                    (controller.secondsLeft ~/ 60).toString().padLeft(2, '0');
                final sec =
                    (controller.secondsLeft % 60).toString().padLeft(2, '0');
                return Center(
                  child: Text(
                    "$min Min $sec Secs",
                    style: CustomStyles.black12400.copyWith(color: Colors.red),
                  ),
                );
              } else {
                return const SizedBox.shrink();}
                      }
                      ),
                     
                      const SizedBox(height: 20),
              
                      // Create Button
                    Obx(() =>   SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          onPressed: () { 
                            controller.clickMpinButton(controller.actionStatus.value);
                          },
                          text: controller.actionStatus.value=='SET'?"CREATE": controller.actionStatus.value=='FORGOT'?"SUBMIT":"RESET",
                        ),
                      ),),
              
                      const SizedBox(height: 10),
        
                      Obx(() {
                         if (controller.showResendText.value || controller.secondsLeft.value==0) {
                           return  Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Did not receive the OTP? ",
                              style: CustomStyles.grey123,
                              children: [
                                
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                         controller.sendOtpStatusBase();
                                      },
                                    text: "Resend", style: CustomStyles.dblue12500),
                              ]),
                        ),
                      ) ;
                         } else {return const SizedBox.shrink();}
                      })
                      
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        Obx(
                    () => controller.isLoading.value
                        ? Container(
                            color: Colors.black.withOpacity(0.03),
                            child: const Center(
                              child: Customloader(),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
      ],)
    );
  }
}
