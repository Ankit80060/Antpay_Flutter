import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/views/miniAcc/controller/mini_acc_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../custom_widget/custom_appbar.dart';
import '../../MainScaffold.dart';
import '../../custom_widget/custom_button.dart';
import '../../res/color_palette.dart';

class MiniAccOtpPage extends StatelessWidget {
  final String service;
  MiniAccOtpPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MiniAccountOtpController(service));
    return MainScaffold(
        body: AbsorbPointer(
          absorbing: controller.isLoading.value,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/profileicon1.png',
                      height: 120.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/profile_ant_hand.png',
                            width: 120,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Image.asset(
                                //   'assets/images/antpay_logo.png',
                                //   scale: 1.2,
                                // ),
                                Text(
                                  'Confirm OTP',
                                  style: CustomStyles.black20500.copyWith(),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Enter OTP sen to mobile",
                                  style: CustomStyles.grey123
                                      .copyWith(color: AppColors.black54),
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '+91 ',
                                        style: CustomStyles.black12400
                                            .copyWith(color: AppColors.black54),
                                      ),
                                      TextSpan(
                                        text: controller.useMobileNumber.value,
                                        style:
                                            CustomStyles.black12600.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),

                                Pinput(
                                  length: 6,
                                  keyboardType: TextInputType.number,
                                  controller: controller.otpController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textInputAction: TextInputAction.next,
                                  showCursor: true,
                                  autofocus: true,
                                  obscureText: true,
                                  onCompleted: null,
                                  defaultPinTheme: PinTheme(
                                    width: 40,
                                    height: 35,
                                    textStyle: CustomStyles.black14500,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                    ),
                                  ),
                                  focusedPinTheme: PinTheme(
                                    width: 40,
                                    height: 35,
                                    textStyle: CustomStyles.black14500
                                        .copyWith(color: AppColors.black54),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.red, width: 1),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                Obx(() {
                                  return Center(
                                    child: Text(
                                      controller.timeDisplay.toString(),
                                      style: CustomStyles.black12400
                                          .copyWith(color: Colors.red),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Obx(() {
                                  return controller.isLoading.value
                                      ? Image.asset(
                                          'assets/images/loader_image.gif',
                                          width: 100,
                                          height: 50,
                                        )
                                      : Center(
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: CustomElevatedButton(
                                              bgColor: controller
                                                          .timeDisplay.value ==
                                                      "Time Ended !!"
                                                  ? Colors.grey
                                                  : CustomStyles.bgcolor,
                                              onPressed: () async {
                                                final otpcontroller = controller
                                                    .otpController.text
                                                    .trim();

                                                if (otpcontroller.isEmpty) {
                                                  CustomToast.show(
                                                      "Please Enter OTP");
                                                  return;
                                                }

                                                await controller
                                                    .commanverifyOtp(
                                                  SessionManager()
                                                      .getMobile()
                                                      .toString(),
                                                );
                                              },
                                              text: 'Verify OTP',
                                            ),
                                          ),
                                        );
                                }),
                                GestureDetector(
                                  onTap: () async {
                                    await controller.sendOtp();
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: "Did not receive the OTP? ",
                                        style: CustomStyles.grey123,
                                        children: [
                                          TextSpan(
                                              text: "Resend",
                                              style: CustomStyles.dblue12500),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
