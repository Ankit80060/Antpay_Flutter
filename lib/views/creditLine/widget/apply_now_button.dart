import 'package:flutter/material.dart';

import '../../../res/color_palette.dart';

class ApplyNowButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ApplyNowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.lightbluebg,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
            'Apply Now',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
