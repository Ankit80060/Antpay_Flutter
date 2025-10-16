import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/Top_up_plan_controller.dart';
import 'package:antpay_lite/views/recharge/components/Mobile_PlanListTile2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/color_palette.dart';

class TopUpPlanTabView extends StatelessWidget {
  const TopUpPlanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final TopUpPlanController controller = Get.put(TopUpPlanController());

    return Scaffold(
      backgroundColor: ColorPalette.baseBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (controller.loading.value) {
                return Container(); // empty while loading
              } else if (controller.topUpPlans.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.topUpPlans.length,
                  itemBuilder: (context, index) {
                    final plan = controller.topUpPlans[index];
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

          // Loader GIF
          Obx(() => controller.loading.value
              ? const Center(
                  child: Customloader()
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
