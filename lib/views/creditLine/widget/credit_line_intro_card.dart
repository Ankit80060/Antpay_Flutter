import 'package:flutter/material.dart';
import 'feature_row.dart';

class CreditLineIntroCard extends StatelessWidget {
  const CreditLineIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Now you don't have to wait for your pay cheque each month. Get access to Credit line of upto INR 50000/-",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 8),
            FeatureRow(text: "Check Your Latest Credit Score"),
            SizedBox(height: 8),
            FeatureRow(text: "Quick online approval and"),
            SizedBox(height: 8),
            FeatureRow(
                text:
                    "Any time access to funds - Draw down and Repay anytime"),
          ],
        ),
      ),
    );
  }
}
