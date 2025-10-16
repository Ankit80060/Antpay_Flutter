import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/wallet_setting.dart/controller/walletSettingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../custom_widget/custom_loader.dart';
import '../../res/color_palette.dart';

class WalletSettingPage extends StatelessWidget {
  WalletSettingPage({Key? key}) : super(key: key);
  final controller = Get.find<WalletSettingController>();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wallet Setting', style: CustomStyles.black20500),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white, // white background
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      walletSettingCardItems(
                                          icon: Image.asset(
                                            'assets/images/deactive-physical-card.png',
                                            height: 22,
                                            width: 22,
                                            fit: BoxFit.cover,
                                          ),
                                          titleText: "Block Card/Wallet ",
                                          toggleBtn: true),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey[300],
                                        indent: 20,
                                        endIndent: 10,
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      walletSettingCardItems(
                                          icon: Image.asset(
                                            'assets/images/report-lost-physical-card.png',
                                            height: 22,
                                            width: 22,
                                            fit: BoxFit.cover,
                                          ),
                                          titleText: "Close Wallet Account",
                                          toggleBtn: false),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey[300],
                                        indent: 20,
                                        endIndent: 10,
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      walletSettingCardItems(
                                          icon: Image.asset(
                                            'assets/images/reset-mpin.png',
                                            height: 22,
                                            width: 22,
                                            fit: BoxFit.cover,
                                          ),
                                          titleText: "Reset MPIN",
                                          toggleBtn: false),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.grey[300],
                                        indent: 20,
                                        endIndent: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
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
                ],
              )),
        ));
  }

  Row walletSettingCardItems({required Image icon, titleText, toggleBtn}) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  //  titleText=='Block Card/Wallet'? null:
                  controller.clickCardTitle(titleText);
                },
                child: Text(
                  titleText,
                  style: CustomStyles.black12400,
                ),
              ),
            ],
          ),
        ),

        // Toggle Switch
        if (toggleBtn)
          Obx(
            () => Transform.scale(
              scale: 0.8, //
              child: Switch(
                activeColor: Colors.red,
                inactiveThumbColor: AppColors.bordercolor,
                inactiveTrackColor: AppColors.black54.withOpacity(0.3),
                trackOutlineWidth:
                    MaterialStatePropertyAll(0), 
                value: controller.isSwitchOn.value,
                onChanged: (val) => controller.handelChangeSwitch(val),
              ),
            ),
          ),
      ],
    );
  }
}
