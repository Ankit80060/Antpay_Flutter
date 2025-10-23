import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/viewmodels/loan/loan_offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class LoanOfferScreen extends StatelessWidget {
  LoanOfferScreen({super.key});

  final LoanOfferController controller = Get.put(LoanOfferController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Obx(() => SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  // 1. log the current value
                  print('LOAN-STATUS VALUE: ${controller.loanStatus.value}');

                  // 2. existing UI tree
                  if (controller.isLoadingStatus.value) {
                    return const Center(child: Customloader());
                  } else if (controller.loanStatus.value == null) {
                    return const Center(
                      child: Text(
                        "Failed to fetch loan status.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    );
                  } else {
                    return buildLoanStatusCard();
                  }
                }),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BEST OFFERS FOR YOU",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.isLoadingOffers.value)
                  const Center(
                    child: Customloader(),
                  )
                else if (controller.loanOffers.value == null ||
                    controller.loanOffers.value!.isEmpty)
                  const Center(
                    child: Text(
                      "No loan offers available.",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.loanOffers.value!.length,
                    itemBuilder: (context, index) {
                      final loanOffer = controller.loanOffers.value![index];
                      print("Rendering offer: $loanOffer");
                      return GestureDetector(
                        onTap: () =>
                            controller.navigateToLoanVerifyDetails(loanOffer),
                        child: buildBankOfferCard(loanOffer),
                      );
                    },
                  ),
              ],
            ),
          )),
    );
  }

  Widget buildBankOfferCard(Map<String, dynamic> loanOffer) {
    return SizedBox(
      height: 125,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 90.0,
                height: 80.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Center(
                    child: Image.network(
                      loanOffer["image"] ?? '',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 60.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get loan at ${loanOffer["min_int_rate"] ?? 'N/A'}% from ${loanOffer["name"] ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Interest Rate : ${loanOffer["min_int_rate"] ?? 'N/A'}% - ${loanOffer["max_int_rate"] ?? 'N/A'}% (Floating)',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                    Text(
                      'EMI : ₹${loanOffer["full_emi_calulate"] ?? 'N/A'}',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                    Text(
                      'Loan Amount : ₹${loanOffer["loan_amount_calculate"] ?? 'N/A'}',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                    Text(
                      'Tenure time : ${loanOffer["tenor_calculate"] ?? 'N/A'} months',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    // SizedBox(
                    //   height: 100,
                    //   child: SingleChildScrollView(
                    //     child: Html(
                    //       data: loanOffer["loan_description"] ?? "",
                    //       style: {
                    //         'body': Style(
                    //           fontSize: FontSize(12),
                    //           lineHeight: LineHeight(1.4),
                    //           color: Colors.black,
                    //           fontFamily: GoogleFonts.poppins().fontFamily,
                    //         ),
                    //         'ul':
                    //             Style(margin: Margins.only(left: 16, bottom: 8)),
                    //         'li': Style(margin: Margins.only(bottom: 4)),
                    //         'strong': Style(fontWeight: FontWeight.bold),
                    //         'a': Style(
                    //           color: Colors.blue,
                    //           textDecoration: TextDecoration.underline,
                    //         ),
                    //       },
                    //       onLinkTap: (url, _, __) async {
                    //         if (url != null) {
                    //           final uri = Uri.parse(url);
                    //           if (await canLaunchUrl(uri)) {
                    //             await launchUrl(uri,
                    //                 mode: LaunchMode.externalApplication);
                    //           }
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoanStatusCard() {
    final appliedLoanAmount =
        controller.loanStatus.value?['applied_loan_amount'] ?? 'Not Available';
    final status = controller.loanStatus.value?['msg'] ?? 'Unknown';
    final approvedLoanAmount =
        controller.loanStatus.value?['approve_loan_amount'] ?? 'Not Available';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Requested Amount: ₹",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  appliedLoanAmount,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Approved Amount: ₹",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  '$approvedLoanAmount',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  '$status',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "* Response as per the Lender's Criteria",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
