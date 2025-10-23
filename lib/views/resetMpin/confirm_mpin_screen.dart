import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_shape.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/AccountTransfer/VerifyW2ACredentialsRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_fetch_beneficiary.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/resetMpin/controller/confirm_mpin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../viewmodels/account_transfer_controller/account_transfer_benefically_controller.dart';

class ConfirmMPINScreen extends StatelessWidget {
  ConfirmMPINScreen({super.key});
  final controller = Get.put(ConfirmMpinController());
  final accountTranferController =
      Get.put(AccountTransferBeneficaillyController());

  @override
  Widget build(BuildContext context) {
    var beneficiaryData = Get.arguments;

    return Scaffold(
      appBar: CustomAppbar(showBackIcon: true,),
      backgroundColor: CustomStyles.bgcolor,
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                height: 250,
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
                    Text("Enter 6 digit MPIN", style: CustomStyles.black18600),
                    const SizedBox(height: 30),
                    Pinput(
                      length: 6,
                      obscureText: true,
                      focusedPinTheme: PinTheme(
                        width: 40,
                        height: 35,
                        textStyle: CustomStyles.black14500
                            .copyWith(color: AppColors.black54),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        width: 40,
                        height: 35,
                        textStyle: CustomStyles.black14500,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller.mpinController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.done,
                       autofillHints: const [], 
                      showCursor: true,
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      text: "Confirm MPIN",
                      onPressed: () async {
                        VerifyW2ACredentialsRequest request =
                            VerifyW2ACredentialsRequest(
                          mobileNumber: SessionManager().getMobile().toString(),
                          aParam: AppConstant.generateAuthParam(
                              SessionManager().getMobile().toString()),
                          mpin: controller.mpinController.value.text,
                          deviceId: SessionManager().getDeviceId(),
                          token: SessionManager()
                              .getPayUCustomerWalletTransferToken(),
                        );

                        await controller.verifyW2ACredential(
                            request,
                            beneficiaryData,
                            controller.mpinController.value.text);

                        print(beneficiaryData.bankAccountNumber);
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        accountTranferController.send2FAOtp("FORGOT");
                        Get.toNamed(RoutesName.resetMpin, arguments: "FORGOT");
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Forgot your MPIN? ",
                          style: CustomStyles.grey145,
                          children: [
                            TextSpan(
                                text: "Reset Now",
                                style: CustomStyles.dblue14500),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          //               Obx(() {
          //   return otpcontroller.loading.value
          //   ? Positioned.fill(
          //     child: Container(
          //     color: Colors.black.withOpacity(0.2),
          //     child: Center(
          //       child: Image.asset(
          //         'assets/images/loader_image.gif',
          //         width: 100,
          //         height: 100,
          //       ),
          //     ),
          //     ),
          //     )
          //   : const SizedBox.shrink();
          // }),
        ],
      ),
    );
  }
}
