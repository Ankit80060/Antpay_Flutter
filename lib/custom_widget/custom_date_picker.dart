import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomdatePicker extends StatefulWidget {
  final TextEditingController controller;
 String? labelText;
 DateTime? firstDate;
 DateTime? lastDate;
  CustomdatePicker({
    required this.controller,
    this.labelText,this.firstDate,this.lastDate
  });

  @override
  State<CustomdatePicker> createState() => _CustomdatePickerState();
}

class _CustomdatePickerState extends State<CustomdatePicker> {
  DateTime currentDate = DateTime.now();

  String? SelectDate;

  datePicker(context) async {
    DateTime? userSelectDate = await showDatePicker(
        context: context,
        builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
          useMaterial3: false, 
          datePickerTheme: const DatePickerThemeData(
        
            
            headerHelpStyle: TextStyle(
              fontSize: 0,
            ),
          ),
          primaryColor: Colors.red,
          colorScheme: const ColorScheme.light(
            primary: Colors.red, 
            onPrimary: Colors.white,
            onSurface: Colors.black, 
          ),
          dialogBackgroundColor: Colors.white,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),
            ),
            child: child!),
        initialDate: currentDate,
        firstDate: widget.firstDate??DateTime.now(),
        lastDate: widget.lastDate??DateTime(currentDate.year + 50));

    if (userSelectDate == null) {
      currentDate = currentDate;
    } else {
      setState(() {
        currentDate = userSelectDate;
        SelectDate =
            '${currentDate.day}/${currentDate.month}/${currentDate.year}';
               widget.controller.text = DateFormat('yyyy-MM-dd').format(currentDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText??'',
            style: CustomStyles.black12400,
          ),
            SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 42,
            child: TextFormField(
              
              readOnly: true,
              style: CustomStyles.black12400,
              controller: widget.controller,
              onTap: () {},
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  enabled: true,
                  isDense: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        datePicker(context);
                      },
                      icon:const Icon(
                        Icons.calendar_month,
                        size: 18,
                        color: Colors.red,
                      )),
                        border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black54),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.black54.withOpacity(0.2),
                ), 
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.dblue.withOpacity(0.8),
                ),
              ),
                  hintStyle:
                  CustomStyles.black12400,
              filled: true,
              fillColor: Colors.white,
                  hintText: "Date",
                 ),
            ),
          ),
        ],
      ),
    );
  }
}