import 'package:flutter/material.dart';

class FeatureRow extends StatelessWidget {
  final String text;
  const FeatureRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_box_outlined,
            size: 18.0, color: Colors.black),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 12.0),
          ),
        )
      ],
    );
  }
}
