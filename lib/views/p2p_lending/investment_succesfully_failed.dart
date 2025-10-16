import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/views/p2p_lending/investment_ammount_screen.dart';
import 'package:antpay_lite/views/p2p_lending/investment_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvestmentPaymnetSuccesfullyFailedScreen extends StatelessWidget {
  const InvestmentPaymnetSuccesfullyFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map orderdata = SessionManager().getGenerateOrderResponse();
    final args = Get.arguments as Map<String, dynamic>? ?? {};

    final bool isSuccess = args['success'] ?? false;
    final String message = args['message']?.toString() ??
        "Transcation ${isSuccess ? "Successful" : "Failed"}";

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
                  style: isSuccess
                      ? CustomStyles.greeb13500
                      : CustomStyles.red13600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                if (isSuccess)
                  Text(
                    isSuccess
                        ? 'Your Payment of Rs.${orderdata['investment_amount'].toString()}  towards Investment in Surge Scheme is successful and may take upto 3 working days to reflect into your Surge dashboard. Incase of any issue, please write to investment@antworksmoney.com'
                        : ' Your payment of INR ${orderdata['investment_amount'].toString()} for Lend Social could not be completed. You will receive refund in next 24-48 hrs. (If deducted)',
                    style: CustomStyles.black12300,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 18.0),
                SizedBox(
                  width: 200,
                  child: CustomElevatedButton(
                    onPressed: () {
                       Get.off(() => InvestmentDashboardScreen());
                    },
                    text:  "Back to Home",
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
