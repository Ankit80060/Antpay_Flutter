import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/viewmodels/recharge/dth_recharge_controller/Dth_Plan_Controller.dart';
import 'package:antpay_lite/views/recharge/components/Dth_PlanListTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class DthPlanTabView extends StatelessWidget {
  const DthPlanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final DthPlanController controller = Get.put(DthPlanController());

    return MainScaffold(
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.loading.value
                  ? const SizedBox()
                  : controller.data3g4g.isNotEmpty
                      ? ListView.builder(
                          key: const ValueKey('dth_plan_list'), // Ensure stable rendering
                          itemCount: controller.data3g4g.length,
                          itemBuilder: (context, index) {
                            final plan = controller.data3g4g[index];
                            return DTHPlanListTile2(
                              amount: plan.rs?.months1?.toString() ?? "N/A",
                              Description: plan.desc ?? "No Description",
                              Planname: plan.plan_name ?? "No Plan Name",
                              LastUpdate: plan.last_update ?? "Unknown",
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "Plan Not Available",
                            style: TextStyle(color: Colors.blue, fontSize: 20.0),
                          ),
                        ),
            ),
            if (controller.loading.value)
              Center(child: Customloader()),
          ],
        ),
      ),
    );
  }
}