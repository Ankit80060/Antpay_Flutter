import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/gift_coins_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../custom_widget/custom_loader.dart';

class GiftCoinsScreen extends StatelessWidget {
  GiftCoinsScreen({super.key});
  final controller = Get.find<GiftCoinsPageController>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(
        () => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: controller.isSubmitedGiftCoins.value
              ? _otpContainerWidget(context)
              : _giftCoinForm(),
          // _otpContainerWidget(context)
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
    ]);
  }

  Container _otpContainerWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

      // width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(20),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/antpay_logo.png',
            scale: 1.2,
          ),
          Text(
            'Confirm OTP',
            style: CustomStyles.black14500.copyWith(fontSize: 18.0),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Enter OTP sen to mobile",
            style: CustomStyles.grey123.copyWith(color: AppColors.black54),
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
                  style: CustomStyles.black12600.copyWith(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          //      Text(
          //   "Enter OTP",
          //   style: CustomStyles.black12400,
          // ),
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
                      color: AppColors.bordercolor, width: 1), 
                ),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 40,
              height: 35,
              textStyle:
                  CustomStyles.black14500.copyWith(color: AppColors.black54),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.red, width: 1), 
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),
          // Timer
          Obx(() {
            if (controller.isSubmitedGiftCoins.value) {
              if (!controller.showResendText.value) {
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
                return Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Did not receive the OTP? ",
                      style: CustomStyles.grey123,
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.clickSubmitBtn();
                              },
                            text: "Resend",
                            style: CustomStyles.dblue12500
                            // Add gesture recognizer if you want to handle tap
                            ),
                      ],
                    ),
                  ),
                );
              }
            }
            return const SizedBox.shrink();
          }),

          SizedBox(
            height: 15.0,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: CustomElevatedButton(
                onPressed: () {
                  controller.clickVerifyOtpBtn();
                },
                text: 'Verify OTP',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _giftCoinForm() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

      // width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(20),
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
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(
            'Gift AntPay Coins',
            style: CustomStyles.black20500.copyWith(),
          ),
          const SizedBox(height: 8),
          Text(
            "Gift Reward Coins to your Loved ones on special occasion as "
            "a token of love and spread happiness",
            style: CustomStyles.grey123.copyWith(color: AppColors.black54),
          ),
          const SizedBox(height: 10),

          // Mobile Input
          CustomTextField(
            controller: controller.mobileController,
            hintText: 'Enter Mobile no',
            labelText: 'Enter Mobile no',
            textInputType: TextInputType.phone,
            length: 10,
            onChanged: (p0) {},
          ),

          // const SizedBox(height: 15),

          // Coins Input
          CustomTextField(
            controller: controller.coinsController,
            hintText: 'Enter Reward Coins',
            labelText: 'Reward coins to be sent',
            textInputType: TextInputType.phone,
            length: 10,
            onChanged: (p0) {},
          ),
          const SizedBox(height: 20),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () {
                controller.clickSubmitBtn();
              },
              text: 'SUBMIT',
            ),
          ),
        ],
      ),
    );
  }
}
