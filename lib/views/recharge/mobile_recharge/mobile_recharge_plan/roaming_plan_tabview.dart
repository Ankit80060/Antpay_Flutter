import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/roaming_plan_controller.dart';
import 'package:antpay_lite/views/recharge/components/Mobile_PlanListTile2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/color_palette.dart';

class RoamingPlanTabView extends StatelessWidget {
  const RoamingPlanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final RoamingPlanController controller = Get.put(RoamingPlanController());

    return Scaffold(
      backgroundColor: ColorPalette.baseBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (controller.loading.value) {
                return Container(); // empty while loading
              } else if (controller.roamingPlans.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.roamingPlans.length,
                  itemBuilder: (context, index) {
                    final plan = controller.roamingPlans[index];
                    return MobilePlanListTile2(
                      amount: plan.rs.toString(),
                      Description: plan.desc.toString(),
                      Validity: plan.validity.toString(),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    "Plan Not Available",
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                  ),
                );
              }
            }),
          ),

          // Loader
          Obx(() => controller.loading.value
              ? Center(
                  child: Image.asset(
                    'assets/images/loader_image.gif',
                    width: 80,
                    height: 80,
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
