import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T value;
  final Function(T) onChanged;
  final TextStyle? textStyle;
  final Color dropdownColor;
  final Color borderColor;
  final String Function(T)? itemLabel;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.textStyle,
    this.dropdownColor = Colors.white,
    this.borderColor = const Color(0xFFDDDDDD),
    this.itemLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          value: value,
          isExpanded: true,

          // Dropdown Items (with divider)
          items: items.map((f) {
            final label = itemLabel != null ? itemLabel!(f) : f.toString();
            return DropdownMenuItem<T>(
              value: f,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: textStyle ?? CustomStyles.black12400,
                  ),
                  if (f != items.last)
                    const Divider(
                      height: 25,
                      color: Colors.grey,
                    ),
                ],
              ),
            );
          }).toList(),

          // Selected Item (without divider)
          selectedItemBuilder: (context) {
            return items.map((f) {
              final label = itemLabel != null ? itemLabel!(f) : f.toString();
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: textStyle ?? const TextStyle(fontSize: 14),
                ),
              );
            }).toList();
          },

          onChanged: (val) {
            if (val != null) onChanged(val);
          },
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: dropdownColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            offset: const Offset(0, -5),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownWithoutUnderLine extends StatelessWidget {
  final List<dynamic> items;
  final dynamic value;
  final Function(dynamic) onChanged;
  final TextStyle? textStyle;
  final Color dropdownColor;
  final Color borderColor;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  String? from;

  CustomDropdownWithoutUnderLine(
      {Key? key,
      required this.items,
      required this.value,
      required this.onChanged,
      this.textStyle,
      this.dropdownColor = Colors.white,
      this.borderColor = const Color(0xFFDDDDDD),
      this.labelText,
      this.hintText,
      this.validator,
       this.from})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? "",
            style: from != null
                ? CustomStyles.black14500
                : CustomStyles.grey123.copyWith(color: AppColors.black54),
          ),
          SizedBox(height: from != null ? 10.0 : 5),
          Container(
            height: 42,
            width: double.infinity,
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: borderColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                value: (value == null || value!.isEmpty) ? null : value,
                isExpanded: true,
                hint: Text(
                  hintText ?? "Select option",
                  style: textStyle?.copyWith(color: Colors.grey) ??
                      CustomStyles.black12400.copyWith(color: Colors.grey),
                ),
                items: items.map((f) {
                  return DropdownMenuItem<dynamic>(
                    value: from != null  ? f.id.toString() : f["id"].toString(),
                    child: Text(
                      from != null  ? f.categoryName : f["textName"],
                      style: textStyle ?? CustomStyles.black12400,
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    final selected = items.firstWhere((e) =>
                        (from != null  ? e.id.toString() : e["id"].toString()) ==
                        val);
                    onChanged(selected);
                  }
                },
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: dropdownColor,
                  ),
                  offset: const Offset(0, -5),
                ),
                iconStyleData:
                    IconStyleData(iconEnabledColor: Colors.grey.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropdownFormField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<T>? validator;
  final ValueChanged<T?> onChanged;
  final TextStyle? textStyle;

  const CustomDropdownFormField({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.validator,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? '',
            style: CustomStyles.black12400,
          ),
          const SizedBox(height: 5.0),
          DropdownButtonFormField<T>(
            value: selectedValue,
            style: textStyle?.copyWith(color: Colors.grey) ??
                CustomStyles.black12400.copyWith(color: Colors.grey),
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              hintStyle: textStyle?.copyWith(color: Colors.grey) ??
                  CustomStyles.black12400.copyWith(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
            ),
            items: items,
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}





class CustomTypeAheadFormField<T> extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Future<List<T>> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSuggestionSelected;
  final TextStyle? textStyle;

  const CustomTypeAheadFormField({
    Key? key,
    required this.controller,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    this.labelText,
    this.hintText,
    this.validator,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Text(labelText!, style: CustomStyles.black12400),
          if (labelText != null) const SizedBox(height: 5.0),
          TypeAheadFormField<T>(
            validator: validator,
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                isDense: true,
                hintStyle: textStyle?.copyWith(color: Colors.grey) ??
                    CustomStyles.black12400.copyWith(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black54),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.black54.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.dblue.withOpacity(0.8)),
                ),
                counterText: '',
              ),
              style: textStyle ?? CustomStyles.black12400,
              cursorColor: Colors.red,
              cursorWidth: 1,
            ),
            suggestionsCallback: suggestionsCallback,
            itemBuilder: (context, suggestion) => itemBuilder(context, suggestion),
            onSuggestionSelected: (suggestion) =>
                onSuggestionSelected(suggestion),
            noItemsFoundBuilder: (context) => const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No items found',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

