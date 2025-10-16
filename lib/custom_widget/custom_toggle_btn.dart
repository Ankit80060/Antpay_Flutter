import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToggleBtn extends StatelessWidget {
  final RxBool switchValue;
  final Function(bool)? onChanged;
  final double scale;
  final Color activeColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final String? text;
  final IconData? icons;

  const CustomToggleBtn({
    Key? key,
    required this.switchValue,
    required this.onChanged,
    this.scale = 0.8,
    this.activeColor = Colors.red,
    this.inactiveThumbColor = Colors.grey,
    this.inactiveTrackColor = const Color(0xFFF0F0F0),
    this.text,this.icons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
Icon(icons),SizedBox(width: 10,),
          Text(text??"",style: CustomStyles.black14500,),Spacer(),
          Transform.scale(
            scale: scale,
            child: Switch(
              activeColor: activeColor,
              inactiveThumbColor: inactiveThumbColor,
              inactiveTrackColor: inactiveTrackColor,
              trackOutlineWidth: const MaterialStatePropertyAll(0),
              value: switchValue.value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
