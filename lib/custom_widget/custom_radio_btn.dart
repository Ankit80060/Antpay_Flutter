import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

class CustomRadioOption extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final String label;
  final Color activeColor;
  final TextStyle? textStyle;

  const CustomRadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.activeColor = Colors.red,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          SizedBox(height: 20,width: 20,
            child: Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: activeColor,
            ),
          ),SizedBox(width: 10,),
          Text(label, style: CustomStyles.black12300),
        ],
      ),
    );
  }
}
