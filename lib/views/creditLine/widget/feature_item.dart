import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String asset;
  final String text;

  const FeatureItem({
    super.key,
    required this.asset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(asset, height: 50, width: 50),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 12.0),
        ),
      ],
    );
  }
}
