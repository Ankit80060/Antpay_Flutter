import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/dashboard_controller/custom_dashboard_controller.dart';
import 'package:antpay_lite/views/dashboard/home_screen.dart';
import 'package:antpay_lite/views/profile/profile_drawer.dart';
import 'package:antpay_lite/views/social/social_view.dart';
import 'package:antpay_lite/views/transaction/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_utils.dart';

class CustomDashboardScreen extends StatelessWidget {
  CustomDashboardScreen({super.key});
  final controller = Get.put(
    CustomDashboardController(),
  );

  final List<Widget> pages = [
    HomeScreen(),
    ProfileView(),

    TransactionHistory(),
    SocialView(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.willPopFunction(),
      child: Scaffold(
        appBar: CustomAppbar(),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
        bottomNavigationBar: Obx(
          () => CommonUtils.customBottomNavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onTap: controller.onTapped,
          ),
        ),
      ),
    );
  }
}
