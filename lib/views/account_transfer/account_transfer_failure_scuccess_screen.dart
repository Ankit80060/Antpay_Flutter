import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/p2p_lending/investment_ammount_screen.dart';
import 'package:antpay_lite/views/p2p_lending/investment_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPaymnetSuccesfullyFailedScreen extends StatelessWidget {
  const WalletPaymnetSuccesfullyFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};

    final bool isSuccess = args['success'] ?? false;
    final String amount = args['amount']?.toString() ?? '';
    final String paymentId = args['paymentId']?.toString() ?? '';
    final String beneficiary = args['beneficiary']?.toString() ?? '';
    final String message = args['message']?.toString() ??
        "Transaction ${isSuccess ? "Successful" : "Failed"}";

    final String imageAsset = isSuccess
        ? "assets/images/investment_sucess.png"
        : "assets/images/investment_fail.png";

    return Scaffold(
      body: Center(
        child: Container(
          height: 450,
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
                  style: isSuccess
                      ? CustomStyles.greeb13500
                      : CustomStyles.red13600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  isSuccess
                      ? 'Transfer of ₹${SessionManager().getValue()} to $beneficiary has been processed successfully.\nIt will reflect in the beneficiary\'s wallet within 2–4 hours.'
                      : 'Your transfer of ₹${SessionManager().getValue()} to $beneficiary could not be completed.\nIf the amount was deducted, it will be refunded within 24–48 hours.',
                  style: CustomStyles.black12300,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                if (paymentId.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Payment ID: $paymentId",
                    style: CustomStyles.black12400,
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 200,
                  child: CustomElevatedButton(
                    onPressed: () {
                  Get.offNamed(RoutesName.dashboard);
                    },
                    text:  "Back to Home",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
