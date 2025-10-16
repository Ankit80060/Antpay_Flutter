import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class InvestmentInvoiceDetailScreen extends StatelessWidget {
  InvestmentInvoiceDetailScreen({super.key});
  var controller = Get.put(InvestmentInvoiceDetailController());
  @override
  Widget build(BuildContext context) {

    return MainScaffold(
    body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Customloader());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/lend_social_banner.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Total Amount", style: CustomStyles.black18600),
                      const SizedBox(height: 8),
                      Text("₹ ${controller.totalAmount}",
                          style: CustomStyles.black15600),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Investment Amount ",
                              style: CustomStyles.grey125),
                          Text("₹ ${controller.investedAmount}",
                              style: CustomStyles.black12400),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Lender Processing Fee ",
                              style: CustomStyles.grey125),
                          Text("₹ ${controller.processingFee}",
                              style: CustomStyles.black12400),
                          Text("  Platform Fee ", style: CustomStyles.grey125),
                          Text("₹ ${controller.platformFee}",
                              style: CustomStyles.black12400),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomElevatedButton(
                        width: 200,
                        onPressed: () {
                          // controller.getGenerateOrder();
                        },
                        text: "Pay Now",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
