
import 'package:flutter/material.dart';

import '../../../../res/color_palette.dart';

class RateCutterPlanTabView extends StatefulWidget {
  const RateCutterPlanTabView({super.key});

  @override
  State<RateCutterPlanTabView> createState() => _RateCutterPlanTabViewState();
}

class _RateCutterPlanTabViewState extends State<RateCutterPlanTabView> {
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
