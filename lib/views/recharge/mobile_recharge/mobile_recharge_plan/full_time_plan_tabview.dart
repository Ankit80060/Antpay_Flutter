import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/full_time_plan_controller.dart';
import 'package:antpay_lite/views/recharge/components/Mobile_PlanListTile2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/color_palette.dart';
class FullTimePlanTabView extends StatelessWidget {
  const FullTimePlanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final FullTimePlanController controller = Get.put(FullTimePlanController());

    return Scaffold(
      backgroundColor: ColorPalette.baseBackgroundColor,
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (controller.loading.value) {
                return Container(); // show nothing when loading
              } else if (controller.fullTimePlans.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.fullTimePlans.length,
                  itemBuilder: (context, index) {
                    final plan = controller.fullTimePlans[index];
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
                    style: TextStyle(color: Colors.blue, fontSize: 20),
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
