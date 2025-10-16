import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/combo_plan_tabview.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/full_time_plan_tabview.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/roaming_plan_tabview.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/sms_plan_tabview.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/three_g_pla_tabview.dart';
import 'package:antpay_lite/views/recharge/mobile_recharge/mobile_recharge_plan/top_up_plan_tabview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../MainScaffold.dart';

class MobileRechargePlanView extends StatelessWidget {
  const MobileRechargePlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MobileRechargePlanController());

    // Fetch plans when screen opens
    Future.delayed(Duration.zero, () => controller.servicePlan());

    return DefaultTabController(
      length: 6,
      child: MainScaffold(
        
        body: Column(
          children: [
            const TabBar(
              isScrollable: true,
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              tabs: [
                Tab(child: Center(child: Text('FULLTT'))),
                Tab(child: Center(child: Text('TOPUP'))),
                Tab(child: Center(child: Text('Roaming'))),
                Tab(child: Center(child: Text('3G/4G'))),
                Tab(child: Center(child: Text('COMBO'))),
                Tab(child: Center(child: Text('SMS'))),
              ],
            ),
            Expanded(
              child: Obx(() {
                // Handle loading state
                if (controller.isLoading.value) {
                  return const Center(
                      child: Customloader()); // or Customloader()
                }

                // Return tab views
                return const TabBarView(
                  children: [
                    FullTimePlanTabView(),
                    TopUpPlanTabView(),
                    RoamingPlanTabView(),
                    ThreeGPlanTabView(),
                    ComboPlanTabView(),
                     SMSPlanTabView(),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
