import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final bool? obscureText;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final String hintText;
  final String? labelText;
  final int? length;
  TextInputType? textInputType;
  final Color? fillColor;
  final BoxDecoration? borderDecoration;
  final Widget? suffixIcon;
  List<TextInputFormatter>? inputformater;
  final int? maxLine;
  bool? enabled;
  final FocusNode? focusNode;
  final int? minLength;
  final bool? readOnly;
  final VoidCallback? onTap;

  CustomTextField(
      {required this.controller,
      this.obscureText,
      this.suffixIcon,
      this.autovalidateMode,
      this.labelText,
      this.length,
      required this.hintText,
      this.onChanged,
      this.validator,
      this.textInputType,
      this.fillColor,
      this.borderDecoration,
      this.inputformater,
      this.maxLine,
      this.enabled,
      this.focusNode,
      this.minLength,
      this.readOnly, // new
      this.onTap});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) ...[
            Text(widget.labelText!, style: CustomStyles.black12400),
            SizedBox(
              height: 5.0,
            ),
          ],
          TextFormField(
            focusNode: widget.focusNode,
            inputFormatters: widget.inputformater,
            cursorColor: Colors.red,
            cursorWidth: 1,
            enabled: widget.enabled ?? true,
            cursorRadius: Radius.zero,
            autovalidateMode: widget.autovalidateMode,
            onChanged: widget.onChanged,
            textAlign: TextAlign.start,
            maxLength: widget.length,
            keyboardType: widget.textInputType,
            style: CustomStyles.black12400,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText ?? false,
            maxLines: widget.maxLine ?? 1,
            readOnly: widget.readOnly ?? false,
            onTap: widget.onTap,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              hintStyle:
                  CustomStyles.grey123.copyWith(color: AppColors.black54),
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              // border: ,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black54),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.black54.withOpacity(0.2),
                ), // when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.dblue.withOpacity(0.8),
                ),
              ),
              // enabledBorder: InputBorder.none,
              counterText: '',
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextFieldwithoutlabel extends StatefulWidget {
  final bool? obscureText;
  final bool? enabled;
  final double? height;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final String hintText;
  int? maxlenth;
  List<TextInputFormatter>? inputformater;
  TextInputType? textInputType;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  CustomTextFieldwithoutlabel(
      {required this.controller,
      this.obscureText,
      this.enabled,
      this.suffixIcon,
      this.autovalidateMode,
      required this.hintText,
      this.onChanged,
      this.validator,
      this.textInputType,
      this.maxlenth,
      this.fillColor,
      this.inputformater,
      this.borderColor,
      this.height,
      this.focusNode});

  @override
  State<CustomTextFieldwithoutlabel> createState() =>
      _CustomTextFieldwithoutlabelState();
}

class _CustomTextFieldwithoutlabelState
    extends State<CustomTextFieldwithoutlabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: widget.height ?? 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.fillColor ?? Colors.white,
            border:
                Border.all(color: widget.borderColor ?? CustomStyles.bgcolor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            focusNode: widget.focusNode,
            inputFormatters: widget.inputformater,
            autovalidateMode: widget.autovalidateMode,
            onChanged: widget.onChanged,
            enabled: widget.enabled,
            textAlign: TextAlign.start,
            keyboardType: widget.textInputType,
            style: CustomStyles.black13500,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText ?? false,
            maxLength: widget.maxlenth,
            decoration: InputDecoration(
                hintStyle: CustomStyles.grey125,
                filled: true,
                counterText: "",
                fillColor: widget.fillColor ?? Colors.white,
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon,
                border: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
