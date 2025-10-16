import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

class ScoreInfoWidget extends StatelessWidget {
  final String label;
  final String value;

  const ScoreInfoWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, textAlign: TextAlign.center, style:CustomStyles.black10400),
            const SizedBox(height: 5),
      
            Text(value, style: CustomStyles.black13500.copyWith(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
