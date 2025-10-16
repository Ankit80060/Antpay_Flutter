import 'package:flutter/material.dart';
import '../../../res/color_palette.dart';
import 'feature_item.dart';

class CreditLineHeader extends StatelessWidget {
  const CreditLineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.lightbluebg,
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        children: [
          Image.asset(
            'assets/images/buddy_logo_icon.png',
            height: 70,
            width: 150,
            fit: BoxFit.fill,
          ),
          const Text(
            "Credit Line",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const Text(
            "Here is what you get",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FeatureItem(
                    asset: 'assets/images/easy_onbording.png',
                    text: "Easy Digital\nOnboarding"),
                FeatureItem(
                    asset: 'assets/images/credit_decision.png',
                    text: "Instant Credit\nDecision"),
                FeatureItem(
                    asset: 'assets/images/linked_ac.png',
                    text: "Linked Account"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
