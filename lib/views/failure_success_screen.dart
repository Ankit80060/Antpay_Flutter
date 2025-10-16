import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/routes/routes_name.dart';

class FailureSuccessScreen extends StatelessWidget {
  const FailureSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};

    final bool isSuccess = args['success'] ?? false;
    final String message = args['message']?.toString() ??
        (isSuccess ? "Transaction Successful" : "Transaction Failed");

    final String imageAsset = isSuccess
        ? "assets/images/investment_sucess.png"
        : "assets/images/investment_fail.png";

    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
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
                  style: isSuccess ? CustomStyles.red16500 : CustomStyles.black13500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                if (isSuccess)
                  Text(
                  isSuccess ?  "Transaction Successfully": "Transaction Failed",
                    style: CustomStyles.black13500,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 18.0),
                SizedBox(
                  width: 200,
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (isSuccess) {
                        Get.toNamed(RoutesName.addMoney, arguments: {"isaddmoney": true});
                      } else {
                        Get.back();
                      }
                    },
                    text: isSuccess ? "Proceed" : "Try Again",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
