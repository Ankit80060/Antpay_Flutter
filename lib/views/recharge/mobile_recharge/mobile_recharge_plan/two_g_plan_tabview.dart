
import 'package:flutter/material.dart';

import '../../../../res/color_palette.dart';

class TwoGPlanTabView extends StatefulWidget {
  const TwoGPlanTabView({super.key});

  @override
  State<TwoGPlanTabView> createState() => _TwoGPlanTabViewState();
}

class _TwoGPlanTabViewState extends State<TwoGPlanTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.baseBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text('Plan Not Available'))
          ],
        ),
      ),
    );
  }
}
