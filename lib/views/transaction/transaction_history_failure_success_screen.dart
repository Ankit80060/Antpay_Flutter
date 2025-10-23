import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/viewmodels/transaction/transaction_datail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';

import '../../MainScaffold.dart';

class TransactionFailureSuccessScreen extends StatelessWidget {
  TransactionFailureSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionDetailController());

    return MainScaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child:Customloader());
        }

        final details = controller.transactionDetails.value;
        if (details == null) {
          return const Center(child: Text("No transaction details found"));
        }

        final imageAsset = controller.isSuccess
            ? "assets/images/investment_sucess.png"
            : "assets/images/investment_fail.png";

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  elevation: 2,
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                imageUrl:   'https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/PhysicalDebitCardBanner%2Fphysical-debitcard-banr.png?alt=media',
                   placeholder: (context, url) =>
                                                      const Center(
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Customloader(),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    color: Colors.grey.shade300,
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons.broken_image,
                                                      color: Colors.grey,
                                                      size: 40,
                                                    ),
                                                  ),
                    fit: BoxFit.cover,
                    height: 180,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 400,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Transaction History", style: CustomStyles.black13500),
                          Text(controller.isSuccess ? "SUCCESS" : "INITIALIZE", style: CustomStyles.black13500),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Image(
                        width: double.infinity,
                        height: 80,
                        image: AssetImage(imageAsset),
                      ),
                      const SizedBox(height: 30),
                      const Divider(color: Colors.grey),
                      InfoRow(heading: "Transaction ID", value: details.transactionNo ?? ""),
                      InfoRow(heading: "Beneficiary Number", value: details.mobile ?? ""),
                      InfoRow(heading: "Amount", value: "₹ ${details.amount ?? 0}"),
                      InfoRow(heading: "Processing Fee", value: "₹ ${details.feeRate ?? 0}"),
                      InfoRow(heading: "Payment Method", value: details.service ?? ""),
                      InfoRow(heading: "Payment ID", value: details.paymentId ?? ""),
                      const Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Amount", style: CustomStyles.black13500),
                          Text("₹ ${controller.totalAmount.value}", style: CustomStyles.black13500),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String heading;
  final String value;

  const InfoRow({Key? key, required this.heading, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(heading, style: CustomStyles.grey125),
          Text(value, style: CustomStyles.black12400),
        ],
      ),
    );
  }
}
