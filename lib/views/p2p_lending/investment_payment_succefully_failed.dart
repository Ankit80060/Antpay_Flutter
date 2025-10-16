import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvestmentSuccesfullyFailedScreen extends StatelessWidget {
  const InvestmentSuccesfullyFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};

    final bool isSuccess = args['success'] ?? false;
    final String message = args['message']?.toString() ??
        (isSuccess ? "Your payment was successful" : "Your payment failed");
    final String paymentId = args['paymentId']?.toString() ?? "-";

    final String imageAsset = isSuccess
        ? "assets/images/investment_sucess.png"
        : "assets/images/investment_fail.png";

    return Scaffold(
      body: Center(
        child: Container(
          height: 420,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: double.infinity,
                  height: 120.0,
                  image: AssetImage(imageAsset),
                ),
                const SizedBox(height: 20.0),
                Text(
                  message,
                  style: isSuccess ? CustomStyles.greeb13500 : CustomStyles.red13500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              
                Text(
                  "Payment ID: $paymentId",
                  style: CustomStyles.black13500,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20.0),
          isSuccess ?       SizedBox(
                  width: 200,
                  child: CustomElevatedButton(
                    onPressed: () {
                     Get.toNamed(RoutesName.p2pLending);
                    },
                    text: "Back to Investment"
                  ),
                ):SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
