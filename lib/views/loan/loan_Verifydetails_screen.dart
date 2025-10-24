import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/loan/loan_verifydetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class LoanVerifyDetailsScreen extends StatelessWidget {
  LoanVerifyDetailsScreen({super.key});

  final controller = Get.put(LoanVerifyDetailsController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.data.value == null) {
          return const Center(
            child: Text('No data available'),
          );
        }

        final data = controller.data.value!.userData;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'VERIFY DETAILS',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  // Details List
                  _buildDetailRow(
                      'Applicant Name', data.personalDetails?.name ?? 'N/A'),
                  _buildDetailRow('Applicant Mail Id',
                      data.personalDetails?.email ?? 'N/A'),
                  _buildDetailRow('Applicant Gender', data.gender ?? 'N/A'),
                  _buildDetailRow('Applicant DOB', data.dob ?? 'N/A'),
                  _buildDetailRow(
                      'Applicant Marital Status', data.maritalstatus ?? 'N/A'),
                  _buildDetailRow('Applied Loan Amount',
                      '${data.min_loan_amount ?? 'N/A'}'),
                  _buildDetailRow(
                      'Applicant Occupation', data.occupation ?? 'N/A'),
                  _buildDetailRow(
                      'Applicant Qualification', data.qualification ?? 'N/A'),
                  _buildDetailRow('City', data.city ?? 'N/A'),
                  _buildDetailRow('State', data.state ?? 'N/A'),
                  _buildDetailRow('Loan Type', data.loanType ?? 'N/A'),
                  _buildDetailRow('Loan Name', data.loanName ?? 'N/A'),
                  _buildDetailRow(
                      'Applicant Company Type', data.companyType ?? 'N/A'),
                  _buildDetailRow(
                      'Applicant Company Name', data.companyName ?? 'N/A'),

                  _buildLoanDetails(
                      data.min_loan_amount, data.bankName, data.min_rate),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Failed to Request",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: const Icon(Icons.close,
                                              size: 18, color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                        thickness: 1, color: Colors.grey),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "Please try after sometime.",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black87),
                                    ),
                                    const SizedBox(height: 16),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Get.toNamed(RoutesName
                                              .dashboard); // Go to home
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: CustomStyles.bgcolor,
                                          foregroundColor: Colors.black87,
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                        ),
                                        child: const Text(
                                          "RETURN TO HOME",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // Refined Detail Row to use RichText for cleaner alignment and style control
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanDetails(
      String? amount, String? bankName, String? interestRate) {
    String loanDetailText = 'N/A';
    if (amount != null && bankName != null && interestRate != null) {
      loanDetailText =
          'Loan of Rs. ${amount} from ${bankName} at an interest rate of ${interestRate}% per year only.${amount}';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
          children: [
            const TextSpan(
              text: 'Loan Details : ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: loanDetailText,
              style: const TextStyle(
                fontWeight:
                    FontWeight.bold, // Make the value bold as in the image
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
