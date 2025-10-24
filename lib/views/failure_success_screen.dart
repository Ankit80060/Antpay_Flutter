import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FailureSuccessScreen extends StatelessWidget {
  const FailureSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};


    final bool isSuccess = args['success'] ?? false;
    final String message = args['message']?.toString() ??
        (isSuccess ? "Transaction Successful" : "Transaction Failed");
    final String amount = args['amount']?.toString() ?? '0';
    final String transferTo = args['transferTo']?.toString() ?? '—';
    final String txnId = args['transactionId']?.toString() ?? '—';
    final String txnType = args['transactionType']?.toString() ?? '—';
    final String txnDate = args['transactionDate']?.toString() ?? '—';

  
    final String imageAsset = isSuccess
        ? "assets/images/payment_success.png"
        : "assets/images/investment_fail.png";

    return Scaffold(
      appBar:  CustomAppbar(showBackIcon: true),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
         
                Image.asset(
                  imageAsset,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 16),

                Text(
                  message,
                  style: isSuccess
                      ? CustomStyles.greeb13500
                      : CustomStyles.red13500,
                  textAlign: TextAlign.center,
                ),

              

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _infoCard(
                      title: "Transaction Amount",
                      value: "₹$amount",
                    ),
                    _infoCard(
                      title: "Transfer To",
                      value: transferTo,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Transaction Details",
                    style: CustomStyles.black14600,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    children: [
                      _detailsRow("Transaction ID", txnId),
                      _divider(),
                      _detailsRow("Type", txnType),
                      _divider(),
                      _detailsRow("Date", txnDate),
                      _divider(),
                      _detailsRow(
                        "Status",
                        isSuccess ? "Success" : "Failed",
                        valueColor: isSuccess ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _infoCard({required String title, required String value}) {
    return Container(
      height: 80,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: CustomStyles.black12400),
          const SizedBox(height: 5),
          Text(
            value,
            style: CustomStyles.black12600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  Widget _detailsRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: CustomStyles.black12400),
          Flexible(
            child: Text(
              value,
              style: CustomStyles.black13500.copyWith(color: valueColor),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }


  Widget _divider() {
    return Divider(color: Colors.grey.shade300, thickness: 1, height: 6);
  }
}
