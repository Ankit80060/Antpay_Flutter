import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/three_g_plan_controller.dart';
import 'package:antpay_lite/views/recharge/components/Mobile_PlanListTile2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/color_palette.dart';
import '../../../../utils/routes/routes_name.dart';

class ThreeGPlanTabView extends StatelessWidget {
  const ThreeGPlanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThreeGPlanController controller = Get.put(ThreeGPlanController());

    return Scaffold(
      backgroundColor: ColorPalette.baseBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (controller.loading.value) {
                return const SizedBox(); // empty while loading
              } else if (controller.data3g4g.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.data3g4g.length,
                  itemBuilder: (context, index) {
                    final plan = controller.data3g4g[index];
                    return InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, RoutesName.bill_payment);
                      },
                      child: MobilePlanListTile2(
                        amount: plan.rs.toString(),
                        Description: plan.desc.toString(),
                        Validity: plan.validity.toString(),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    "Plan Not Available",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
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
