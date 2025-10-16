import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';

class CustomTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;

  const CustomTimePicker({
    Key? key,
    required this.controller,
    this.labelText,
  }) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  void _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            useMaterial3: false,
            timePickerTheme: const TimePickerThemeData(
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        final now = DateTime.now();
        final formatted = DateFormat('HH:mm').format(
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute),
        );
        widget.controller.text = formatted;
      });
    }
    else{
 widget.controller.text =  DateFormat('HH:mm').format(
      DateTime.now(),
    );;
      }
  }

  @override
  Widget build(BuildContext context) {
    final hintTime = DateFormat('HH:mm').format(
      DateTime.now(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText ?? '', style: CustomStyles.black12400),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 42,
            child: TextFormField(
              readOnly: true,
              
              controller: widget.controller,
              style: CustomStyles.black12400,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                suffixIcon: IconButton(
                  onPressed: () => _pickTime(context),
                  icon: Icon(
                    Icons.access_time,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black54),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black54.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.dblue.withOpacity(0.8),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Time",
                hintStyle: CustomStyles.black12400,
              ),
              onTap: () => _pickTime(context),
            ),
          ),
        ],
      ),
    );
  }
}
