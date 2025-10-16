

import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomElevatedButton extends StatefulWidget {
  final text;
  final bgColor;
  final Function()? onPressed;
  final TextStyle? textstyle;
  final double? width;

  
  CustomElevatedButton(
      {super.key, this.text, required this.onPressed, this.bgColor,this.textstyle,this.width});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 42,
          width:widget.width?? MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.text,
              style:widget.textstyle?? CustomStyles.black15600,
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
                foregroundColor:  CustomStyles.bgcolor,
             
                disabledForegroundColor:
                    Color.fromARGB(255, 36, 243, 50).withOpacity(0.38),
                disabledBackgroundColor:
                    Color.fromARGB(255, 36, 243, 50).withOpacity(0.12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
                backgroundColor: widget.bgColor ?? CustomStyles.bgcolor),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
