import 'dart:io';

import 'package:antpay_lite/custom_widget/custom_listtile.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/prefrences/utility_prefrences.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';

import 'package:antpay_lite/viewmodels/profile_controller/profile_drawer_controller.dart';

import 'package:antpay_lite/views/feedback/feedback_screen.dart';
import 'package:antpay_lite/views/profile/profile_form_screen.dart';
import 'package:antpay_lite/views/relation_ship_manger/relation_ship_manager_screen.dart';
import 'package:antpay_lite/views/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final controller = Get.put(ProfileDrawerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                  ),
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Center(
                          child: Obx(() {
                            final localPath = controller.pickedImagePath.value;
                            final networkPath = controller.imagePic.value;
      
                            Widget avatarChild;
      
                            if (localPath.isNotEmpty) {
                              avatarChild = ClipOval(
                                child: Image.file(
                                  File(localPath),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            } else if (networkPath.isNotEmpty) {
                              avatarChild = ClipOval(
                                child: Image.network(
                                  networkPath,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            } else {
                              avatarChild = const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              );
                            }
      
                            return Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey.shade400,
                                  child: avatarChild,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                 
                                          Get.bottomSheet(
          SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt, color: Colors.red),
                    title:  Text('Camera',style: CustomStyles.black14500,),
                    onTap: () {
                      controller.pickImageFromCamera();
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo, color: Colors.red),
                    title:  Text('Gallery',style: CustomStyles.black14500,),
                    onTap: () {
                      controller.pickImageFromGallery();
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
                                    },
                                    child: const CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.edit,
                                          size: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 2.0),
                              RichText(
                                text: TextSpan(
                                    text: "Min A/C Id: ",
                                    style: CustomStyles.black13500,
                                    children: [
                                      TextSpan(
                                          text: SessionManager().getMobile(),
                                          style: CustomStyles.grey125)
                                    ]),
                              ),
                              const SizedBox(height: 2.0),
                              RichText(
                                text: TextSpan(
                                    text: "Min A/C Balance: ",
                                    style: CustomStyles.black13500,
                                    children: [
                                      TextSpan(
                                          text:
                                              "₹ ${SessionManager().getPayUCustomerWalletBalance()??"0"}",
                                          style: CustomStyles.grey125)
                                    ]),
                              ),
                              const SizedBox(height: 2.0),
                              RichText(
                                text: TextSpan(
                                    text: "Wallet Status: ",
                                    style: CustomStyles.black13500,
                                    children: [
                                      TextSpan(
                                          text:
                                              "${SessionManager().getWalletStatus()??"Inactive"}",
                                          style: CustomStyles.grey125)
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: CustomStyles.bgcolor,
                ),
                CustomListtileProfile(
                  title: "Home",
                  icons: "assets/sidebar/home-s.png",
                  onTap: () {
                    Get.offAllNamed(
                      RoutesName.dashboard,
                      arguments: {'bottomNavIndex': 0},
                    );
                  },
                ),
                CustomListtileProfile(
                  title: "Profile",
                  icons: "assets/sidebar/profile-s.png",
                  onTap: () {
                    Get.to(() => ProfileFormScreen());
                  },
                ),
                CustomListtileProfile(
                  title: "Loan",
                  icons: "assets/sidebar/loan-s.png",
                  onTap: () {
                    Get.toNamed(RoutesName.loanhomescreen);
                  },
                ),
                CustomListtileProfile(
                  title: "Investment",
                  icons: "assets/sidebar/investment-s.png",
                  onTap: () {
                     Get.toNamed(RoutesName.p2pLending);
                  },
                ),
                CustomListtileProfile(
                  title: "Insurance",
                  icons: "assets/sidebar/insurance-s.png",
                  onTap: () {
                     CustomToast.show("Comming soon");
                    // Get.toNamed(RoutesName.investmentHomeView);
                  },
                ),
                CustomListtileProfile(
                  title: "Bill Payments",
                  icons: "assets/sidebar/billpay-s.png",
                  onTap: () {
                    Get.toNamed(RoutesName.allBillPay);
                  },
                ),
                CustomListtileProfile(
                  title: "Credit Line",
                  icons: "assets/sidebar/creditline-s.png",
                  onTap: () {
                      CustomToast.show("Comming soon");
                      // Get.toNamed(RoutesName.creditLineView);
                  },
                ),
                CustomListtileProfile(
                  title: "Relationship Manager Details",
                  icons: "assets/sidebar/rm-s.png",
                  onTap: () {
                    Get.to(() => RelationShipManagerScreen());
                  },
                ),
                CustomListtileProfile(
                  title: "Settings",
                  icons: "assets/sidebar/settings-s.png",
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                ),
                CustomListtileProfile(
                    title: "Social",
                    icons: "assets/sidebar/social-s.png",
                    onTap: () {
                      Get.toNamed(RoutesName.social,);
                      // Get.offAllNamed(
                      //   RoutesName.dashboard,
                      //   arguments: {'bottomNavIndex': 2},
                      // );
                    
                    }),
                CustomListtileProfile(
                  title: "Feedback",
                  icons: "assets/sidebar/feedback-s.png",
                  onTap: () {
                    Get.to(() => FeedbackScreen());
                  },
                ),
                CustomListtileProfile(
                  title: "Logout",
                  icons: "assets/sidebar/logout-s.png",
                  onTap: () {
                     controller.clickLogoutFromApp();
                   
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}