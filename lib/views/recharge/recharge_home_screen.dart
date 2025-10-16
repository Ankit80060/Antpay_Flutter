import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/viewmodels/recharge/recharge_home_controller.dart';
import 'package:antpay_lite/views/recharge/components/my_image_text_widget.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../prefrences/session_manager.dart';
import '../../utils/routes/routes_name.dart';

class RechargeHomeScreen extends StatelessWidget {
  RechargeHomeScreen({super.key});
  final RechargHomeController controller = Get.put(RechargHomeController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
    

     
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                margin: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Colors.white,
                  ),
                  child: Image.network(
                    "https://antworksmoney.com/apiserver/assets/img/recharge.png",
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: Image(
                            image: const AssetImage(
                              'assets/images/loader_image.gif',
                            ),
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.10,
                          ), // You can replace this with your loader GIF widget.
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Obx(() {
                      return _balanceCard(
                          title: "Mini A/c Balance",
                          text: controller.walletBalance.value);
                    }),
                    SizedBox(
                      width: 12,
                    ),
                    Obx(
                      () => _balanceCard(
                        title: "AntPay Coins Balance",
                        text: controller.coinsBalance.value,
                        icon: Image.asset(
                          'assets/images/coins.png',
                          scale: 3.0,
                        ),
                        forwardIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Recharge',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text(
                      'What do you want to recharge today?',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              //SizedBox(height: 16.0),
              Card(
                elevation: 2,
                margin: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: ColorPalette.light_blue_bgr,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyImageTextWidget(
                            imagePath: 'assets/images/recharges_db.png',
                            imageText: 'Mobile',
                            onTap: () {
                              
                               SessionManager().addServicetype("Mobile Recharge");
                               Get.toNamed(RoutesName.mobileRechargeView);
                              //Handle tap
                            },
                          ),
                          MyImageTextWidget(
                            imagePath: 'assets/images/dth_icon.png',
                            imageText: 'DTH',
                            onTap: () {
                               SessionManager().addServicetype("DTH Recharge");
                              Get.toNamed(
                                RoutesName.dthRechargeView,
                              );
                            },
                          ),
                          MyImageTextWidget(
                            imagePath: 'assets/images/fastag_icon.png',
                            imageText: 'Fastag',
                            onTap: () {
                              SessionManager().addServicetype("FastTag");
                              Get.toNamed(
                                RoutesName.fastagRechargeView,
                                arguments: "FastTag",
                              );
                            },
                          ),
                          MyImageTextWidget(
                            imagePath: 'assets/images/ncmc_recharge.png',
                            imageText: 'NCMC Metro',
                            onTap: () {
                              Get.toNamed(
                                RoutesName.ncmcmetrorechargescreen,
                                arguments: "NCMC Recharge",
                              );
                             SessionManager().addServicetype("NCMC Recharge");

                              // Navigator.pushNamed(
                              //     context, RoutesName.metro_recharge);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesName.disputescreen);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.error_outline,
                                    size: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Text(
                                    'Have a Dispute, Click here',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: const Color(0xFFFF0000),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}

Widget _balanceCard({
  required String title,
  required String text,
  Image? icon,
  Icon? forwardIcon,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (title == "AntPay Coins Balance") {
          RechargHomeController().handelCardClick();
          return;
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        // elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 2,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomStyles.grey103
                    .copyWith(color: AppColors.black54, fontSize: 11.0),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  if (icon != null) ...[
                    icon,
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      icon != null ? text : "₹ $text",
                      style: CustomStyles.black16600,
                    ),
                  ),
                  if (forwardIcon != null) ...[
                    forwardIcon,
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
