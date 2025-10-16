import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_investment_listtile.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_dashboard_controller.dart';
import 'package:antpay_lite/views/p2p_lending/investment_redemption.view.dart';
import 'package:antpay_lite/views/p2p_lending/investmentplan_screen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MainScaffold.dart';
import '../../res/color_palette.dart';

class InvestmentDashboardScreen extends StatelessWidget {
  final InvestmentDashboardController controller =
      Get.put(InvestmentDashboardController());

  final RxBool showCurrentInvestments = false.obs;
  final RxBool showPastInvestments = false.obs;

  InvestmentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchInvestmentList();

    return MainScaffold(
      
      body: SafeArea(
        child: Obx(
          () => CustomRefreshIndicator(
            onRefresh: () async => await controller.fetchInvestmentList(),
             builder: (context, child, controller) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (controller.isLoading)
           Padding(
            padding: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(color: ColorPalette.nextButtonColor),
          ),
        Transform.translate(
          offset: Offset(0, controller.value * 80),
          child: child,
        ),
      ],
    );
  },
            child: controller.isLoading.value
                ? Center(child: Customloader())
                : SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          'Invest More',
                          style: CustomStyles.black15600,
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomSizeBox(
                                amount: controller.totalInvestmentAmount.value,
                                text: "Total Investment",
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomSizeBox(
                                amount: controller.totalCurrentValue.value,
                                text: "Current Value",
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomSizeBox(
                                amount: controller.totalReturn.value,
                                text: "Total Return",
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildInvestNowCard(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildToggleSection(
                          title: 'View Current Investments',
                          isVisible: showCurrentInvestments,
                          itemCount: controller.currentInvestments.length,
                          builder: () => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.currentInvestments.length,
                            itemBuilder: (context, index) {
                              final item = controller.currentInvestments[index];
                              return CurrentInvestmentListTile(
                                investementNumber:
                                    'Investment No.: ${item.investmentNo}',
                                investementAmount: "${item.amount}",
                                interestValue: "${item.currentValue}",
                                investmentDate: "${item.investmentDate}",
                                interestRate: "${item.finalInterest}",
                                onTap: () {
                                  SessionManager().addDsInvestmentNumber(item.investmentNo.toString());
                                  Get.to(()=>InvestmentRedemptionRequestView());
                                },
                              );
                            },
                          ),
                        ),
                        _buildToggleSection(
                          title: 'View Past Investments',
                          isVisible: showPastInvestments,
                          itemCount: controller.pastInvestments.length,
                          builder: () => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.pastInvestments.length,
                            itemBuilder: (context, index) {
                              final item = controller.pastInvestments[index];
                              return PastInvestmentListTile(
                                investementNumber:
                                    'Investment No.: ${item.investmentNo}',
                                investementAmount: "${item.amount}",
                                investmentDate: "${item.investmentDate}",
                                redemptionDate: "${item.redemptionDate}",
                                onTap: () {
                                   SessionManager().addDsInvestmentNumber(item.investmentNo.toString());
                                  Get.to(()=>InvestmentRedemptionRequestView());
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvestNowCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('You are eligible for more investment options',
                  textAlign: TextAlign.center, style: CustomStyles.black14400),
              const SizedBox(
                height: 10,
              ),
              CustomElevatedButton(
                width: 200,
                onPressed: () {
                  Get.to(()=>InvestmentPlanScreen());
                },
                text: "Invest Now",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleSection({
    required String title,
    required RxBool isVisible,
    required int itemCount,
    required Widget Function() builder,
  }) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () => isVisible.value = !isVisible.value,
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: CustomStyles.black12400,
                  ),
                  Spacer(),
                  Obx(() => Icon(
                        isVisible.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 18,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        ),
        Obx(() => isVisible.value && itemCount > 0 ? builder() : SizedBox()),
      ],
    );
  }
}
