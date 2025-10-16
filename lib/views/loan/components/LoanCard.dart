import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/loan_model/AllLoanModel.dart';
import 'package:flutter/material.dart';

class LoanCard extends StatelessWidget {
  final String? loanTitle;
  final String? accountNumber;
  final String? status;
  final String? date;
  final String? balance;
  final List<LenderDetail>? lenderDetails; // New parameter for lender details

  const LoanCard({
    Key? key,
    required this.loanTitle,
    required this.accountNumber,
    required this.status,
    required this.date,
    required this.balance,
    this.lenderDetails, // Optional, defaults to null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 370,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loanTitle ?? "N/A",
              style: CustomStyles.black14600.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            Text(
              "Loan Id: ${accountNumber ?? "N/A"}",
              style: CustomStyles.dblue12500.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 18.0),
            // Amount and Date Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                    children: [
                      TextSpan(
                          text: "Amount: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          )),
                      TextSpan(
                          text: "₹${balance ?? 'N/A'}",
                          style:
                              TextStyle(color: Colors.red[700], fontSize: 12)),
                    ],
                  ),
                ),
                Text(
                  "Date: ${date ?? "N/A"}",
                  style: CustomStyles.dblue12500.copyWith(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            // Lenders and Status Row with Separator
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lenders:",
                        style: CustomStyles.dblue12500.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        lenderDetails != null && lenderDetails!.isNotEmpty
                            ? lenderDetails!.first.lender_name ?? "Lender Name"
                            : "Lender Name",
                        style: CustomStyles.dblue12500.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // Small vertical line
                Container(
                  height: 25, // small line height
                  width: 1,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: CustomStyles.dblue12500.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        status ?? "N/A",
                        style: CustomStyles.dblue12500.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
