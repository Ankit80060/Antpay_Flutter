import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/custom_widget/custom_investment_listtile.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_plan_controller.dart';

import '../../MainScaffold.dart';

class InvestmentPlanScreen extends StatelessWidget {
  final InvestmentPlanController controller =
      Get.put(InvestmentPlanController());

  InvestmentPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: Customloader())
                : Column(
                    children: [
                      Image.asset(
                        'assets/images/lend_social_banner.png',
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.schemesList.length,
                        itemBuilder: (context, index) {
                          final scheme = controller.schemesList[index];
                          return CustomSchemeListTile(
                            schemeName: scheme.Scheme_Name ?? '',
                            minInvestment: scheme.Min_Inv_Amount ?? '',
                            maxInvestment: scheme.Max_Inv_Amount ?? '',
                            interestRate: scheme.Interest_Rate ?? '',
                            description: scheme.scheme_descripiton ?? '',
                            onTap: () {
                              SessionManager().addSchemeDetailsFull(
                                partnerId: scheme.partner_id ?? '',
                                schemeId: scheme.scheme_id ?? '',
                                minInvAmount: scheme.Min_Inv_Amount ?? '',
                                maxInvAmount: scheme.Max_Inv_Amount ?? '',
                                schemeName: scheme.Scheme_Name ?? '',
                                roc: scheme.Interest_Rate ?? '',
                                description: scheme.scheme_descripiton ?? '',
                              );
                              controller.checkFullKycStatusAndProceed();
                            },
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
