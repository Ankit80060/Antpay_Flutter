import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../custom_widget/custom_loader.dart';
import '../controller/coupons_claim_controller.dart';

class CouponsClaimPage extends StatelessWidget {
  final controller = Get.find<CouponsClaimController>();

  CouponsClaimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: AppColors.bgcolor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(() => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: controller.isClaimSuccess.value
                        ? successfullClaimWidget()
                        : claimMpinWidget(),
                  )),
                ),
              ],
            ),
          ),
        ),
        Obx(() => controller.isLoading.value
            ?
             Container(
                color: Colors.black.withOpacity(0.03),
                child: 
                const Center(
                  child: Customloader(),
                ),
              )
            : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Column claimMpinWidget() {
    return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  "Enter AntPay PIN",
                                  style: CustomStyles.black18400,
                                ),
                              ),
                              const SizedBox(height: 15),
                             if   (controller.imgUrl.value != "" )
                                                 Image.network(
                                                    controller.imgUrl.value,
                                                    // fit: BoxFit.contain,
                                                    scale: 2.0,
                                                    errorBuilder:
                                                        (context, error, stackTrace) =>
                                                            Container(
                                                      width: 50,
                                                      height: 50,
                                                      color: Colors.transparent,
                                                    ),
                                                  )
                                                else const SizedBox(
                                                  width: 160,
                                                        height: 100,
                                                  child: Card(
                                                    color: Colors.white,
                                                    surfaceTintColor: Colors.transparent,

                                                  ),
                                                ),
                  const SizedBox(height: 10.0,),
                              Text(
                                "100 AntPay coins would bee debited from your AntPay reward balance",
                                style: CustomStyles.black12400,
                              ),
                              Pinput(
                                validator: (value) => value == null || value.length < 6
                                    ? 'Please enter a valid 6-digit PIN'
                                    : null,
                                length: 6,
                                keyboardType: TextInputType.number,
                                controller: controller.pinController,
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
                                          color: AppColors.bordercolor,
                                          width: 1), //  underline
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
                                          color: Colors.red,
                                          width: 1), //  focused underline
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 10.0,
                              ),

                              Center(
                                child: Text(
                                  "Enter AntPay pin to reclaim",
                                  style:
                                      CustomStyles.black12400.copyWith(),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Create Button
                              SizedBox(
                                width: double.infinity,
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    controller.clickClaimCoupon();
                                    },
                                  text: "CONFIRM",
                                ),
                              ),

                              const SizedBox(height: 10),
                              ],
                          );
  }

  Column successfullClaimWidget() {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Congratulations!",
                      style: CustomStyles.black14500.copyWith(fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(
                      height: 10.0,
                    ),
                  Center(
                      child: Text(
                        "Your Coupon code ready to use",
                        style: CustomStyles.black12400.copyWith(),
                      ),),
                    
                    
                  const SizedBox(height: 15),
                  if (controller.imgUrl.value != "")
                    Image.network(
                      controller.imgUrl.value,
                      // fit: BoxFit.contain,
                      scale: 2.0,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.transparent,
                      ),
                    )
                  else
                    const SizedBox(
                      width: 160,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.transparent,
                      ),
                    ),

                    SizedBox(height: 10,),

                     IntrinsicWidth(
                       child: Container(
                                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                           decoration: BoxDecoration(
                        color: AppColors.bgcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                                           ),
                                           child: Row(
                        children: [
                          Text(
                            'AFSGSSJSJS',
                            style: CustomStyles.black13500.copyWith(color: AppColors.black54,fontSize: 11.0),
                          ),
                          SizedBox(width: 15,),
                           GestureDetector(
                                         onTap: () {
                                           Clipboard.setData(ClipboardData(text: "AFSGSSJSJS"));
                                         },
                                         child: const Icon(Icons.copy, size: 18, color: Colors.grey),
                                       ),
                        ],
                                           ),
                                         ),
                     ),
               

                  

                  const SizedBox(
                    height: 10.0,
                  ),

                  Center(
                    child: Text(
                      "Your Coupon is available in My Coupons section for future use.",
                      style: CustomStyles.black12400.copyWith(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Create Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        controller.closeClaimCoupon();
                      },
                      text: "DONE",
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              );
  }
}
