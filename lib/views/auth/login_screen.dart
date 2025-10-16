import 'package:antpay_lite/custom_widget/custom_shape.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/auth_controller/login_controller.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomStyles.bgcolor,
      resizeToAvoidBottomInset: false,
      body: AbsorbPointer(
        absorbing: logincontroller.isLoading.value,
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
                top: 120,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 210,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/antpay_logo.png'))),
                    ),
                    Text(
                      "Experience New Age Financial \nServices at AntPay",
                      style: CustomStyles.dblue14500,
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            Positioned(
                top: 300,
                child: Container(
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
                      Text(
                        "Sign Up / Sign In",
                        style: CustomStyles.black18600,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomStyles.bgcolor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "+91",
                              style: CustomStyles.black14600,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: CustomTextFieldwithoutlabel(
                                  onChanged: (mobileNumber) async {
                                    if (mobileNumber.length == 10) {
                                      String? responseName =
                                          await logincontroller
                                              .fetchMerchantName(
                                        logincontroller.phoneController.text
                                            .toString(),
                                      );

                                      if (responseName != null &&
                                          responseName != "" &&
                                          responseName != " ") {
                                        logincontroller.nameController.text =
                                            logincontroller.getMaskedName(
                                                responseName.toString());

                                        logincontroller
                                            .updateFieldsEnabled(false);
                                      } else {
                                        logincontroller.nameController.clear();
                                        logincontroller
                                            .updateFieldsEnabled(true);
                                      }
                                    }
                                  },
                                  inputformater: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textInputType: TextInputType.phone,
                                  controller: logincontroller.phoneController,
                                  maxlenth: 10,
                                  hintText: "Enter Your Mobile Number"))
                        ],
                      ),
                      Obx(() => Visibility(
                            visible: logincontroller.isNewUser.value,
                            child: Column(
                              children: [
                                CustomTextFieldwithoutlabel(
                                  controller: logincontroller.nameController,
                                  textInputType: TextInputType.name,
                                  hintText: "Enter Name",
                                  enabled: logincontroller.fieldsEnabled.value,
                                  onChanged: (newValue) {
                                    logincontroller.username.value = newValue;
                                  },
                                  inputformater: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z\s]')),
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter your Name";
                                    }
                                    if (value.length < 3) {
                                      return "Name too short";
                                    }
                                    return null;
                                  },
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() {
                                      return SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: Checkbox(
                                          focusColor: Colors.lightBlue,
                                          activeColor: Colors.red,
                                          value: logincontroller
                                              .isAcknowledgeChecked.value,
                                          onChanged: (bool? newValue) {
                                            logincontroller.isAcknowledgeChecked
                                                .value = newValue ?? false;
                                          },
                                        ),
                                      );
                                    }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "I acknowledge that my name is as per PAN",
                                        maxLines: 2,
                                        style: CustomStyles.grey115,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                  Obx(
  () => CustomElevatedButton(
    text: "Send OTP",
    bgColor: logincontroller.isAcknowledgeChecked.value == false
        ? Colors.grey
        : CustomStyles.bgcolor,
    onPressed: logincontroller.isLoading.value ||
            !logincontroller.isAcknowledgeChecked.value
        ? null // disables the button
        : () async {
            if (logincontroller.validateInputs()) {
              if (!logincontroller.isCheckedpolicy.value) {
                CustomToast.show("Please accept Terms & Conditions");
                return;
              }

              try {
          
                logincontroller.isLoading.value = true;

                final deviceModel = await logincontroller.deviceInfoSingleton
                    .createDeviceModel(withLocation: false);

                logincontroller.loginDetail.name =
                    logincontroller.nameController.text;
                logincontroller.loginDetail.number =
                    logincontroller.phoneController.text;
                logincontroller.loginDetail.deviceInfo = deviceModel;
                logincontroller.loginDetail.fbToken =
                    logincontroller.firebaseToken.value;

                await logincontroller.sendOTP();

                SessionManager()
                    .addUserName(logincontroller.username.value);
                SessionManager()
                    .addMobile(logincontroller.phoneController.text);
              } catch (e) {
                print("Error in sendOTP: $e");
              } finally {
                logincontroller.isLoading.value = false;
              }
            }
          },
  ),
),

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return SizedBox(
                              height: 18,
                              width: 18,
                              child: Checkbox(
                                focusColor: Colors.lightBlue,
                                activeColor: Colors.red,
                                value: logincontroller.isCheckedpolicy.value,
                                onChanged: (bool? newValue) {
                                  logincontroller.isCheckedpolicy.value =
                                      newValue ?? false;
                                },
                              ),
                            );
                          }),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "I Agree to ",
                                style: CustomStyles.black12300,
                                children: [
                                  TextSpan(
                                      recognizer: logincontroller.tapGestureTC
                                        ..onTap = () {
                                          CustomUrlLauncher.openUrl(
                                              "https://www.antworksmoney.com/Terms_and_condition");
                                        },
                                      text: "Terms of use",
                                      style: CustomStyles.red13500),
                                  const TextSpan(
                                    text: " | ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                  TextSpan(
                                      recognizer:
                                          logincontroller.tapGesturePolicy
                                            ..onTap = () {
                                              CustomUrlLauncher.openUrl(
                                                  "https://www.antworksmoney.com/privacy-policy");
                                            },
                                      text: "Privacy Policy",
                                      style: CustomStyles.red13500),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Obx(() {
              return logincontroller.isLoading.value
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
