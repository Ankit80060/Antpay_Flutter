import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_shape.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/auth_controller/otp_verify_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPVerifyScreen extends StatelessWidget {
  OTPVerifyScreen({super.key});

  final otpcontroller = Get.put(OTPVerifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomStyles.bgcolor,
      resizeToAvoidBottomInset: false,
      body: AbsorbPointer(
        absorbing: otpcontroller.loading.value,
        child: Stack(
          children: [
            const Positioned(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: MyCustomPainter(),
                child: SizedBox(
                  width: double.infinity,
                  height: 400,
                ),
              ),
            )),
            Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46,
                      width: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/antpay_logo.png"))),
                    ),
                    Text(
                      "Experience New Age Financial \nServices at AntPay",
                      style: CustomStyles.dblue14500,
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            Positioned(
                top: 265,
                child: Container(
                  height: 350,
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ]),
                  child: Column(
                    children: [
                      Text("Confirm OTP", style: CustomStyles.black18600),
                      const SizedBox(height: 10),
                      Text("Enter OTP sent to mobile number",
                          style: CustomStyles.grey145),
                      Text(
                        "+91 ${SessionManager().getMobile().toString()}",
                        style: CustomStyles.black13500,
                      ),
                      const SizedBox(height: 30),
                      Pinput(
                        length: 6,
                        defaultPinTheme: PinTheme(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CustomStyles.bgcolor,
                              border: Border.all(color: CustomStyles.bgcolor),
                            )),
                        keyboardType: TextInputType.number,
                        controller: otpcontroller.pincontroller,
                        obscureText: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.done,
                        showCursor: true,
                      onCompleted: (value) => otpcontroller.verifyOtp(),
                      ),
                      const SizedBox(height: 20),
                      Obx(() => Text(
                            otpcontroller.showTime.value,
                            style: CustomStyles.red13600,
                          )),
                      const SizedBox(height: 10),
                      CustomElevatedButton(
                        text: "Verify OTP",
                        onPressed: () {
                          otpcontroller.verifyOtp();
                        },
                      ),
                      const SizedBox(height: 10),
                      Obx(() => InkWell(
                            onTap: otpcontroller.canResend.value
                                ? () async {
                                    final deviceModel = await otpcontroller
                                        .deviceInfoSingleton
                                        .createDeviceModel(withLocation: false);

                                    otpcontroller.loginDetail.name =
                                        SessionManager().getName().toString();
                                    otpcontroller.loginDetail.number =
                                        SessionManager().getMobile().toString();
                                    otpcontroller.loginDetail.deviceInfo =
                                        deviceModel;
                                    otpcontroller.loginDetail.fbToken =
                                        otpcontroller.firebaseToken.value;

                                    await otpcontroller.resendOtp();
                                    otpcontroller.startTimer(180);
                                  }
                                : null,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Did not receive the OTP? ",
                                style: CustomStyles.grey145,
                                children: [
                                  TextSpan(
                                    text: "Resend",
                                    style: otpcontroller.canResend.value
                                        ? CustomStyles.dblue14500
                                        : CustomStyles.grey145,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
            Obx(() {
              return otpcontroller.loading.value
                  ? Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                        child: Center(
                          child: Image.asset(
                            'assets/images/loader_image.gif',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
