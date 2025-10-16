import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

class AutocompleteDropdown<T extends Object> extends StatelessWidget {
  final List<T> items;
  final String hintText;
  final String Function(T) displayString;
  final void Function(T) onSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double maxHeight;
  final double? maxWidth;
  final Widget Function(T)? itemBuilder;

  const AutocompleteDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.displayString,
    required this.onSelected,
    this.controller,
    this.focusNode,
    this.maxHeight = 300,
    this.maxWidth,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Autocomplete<T>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return Iterable<T>.empty();
            }
            return items.where((item) => displayString(item)
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()));
          },
          displayStringForOption: displayString,
          onSelected: onSelected,
          fieldViewBuilder:
              (context, textController, fieldFocusNode, onFieldSubmitted) {
            return CustomTextField(
              labelText: "Biller Name",
              controller: controller ?? textController,
              focusNode: focusNode ?? fieldFocusNode,
              hintText: hintText,
              textInputType: TextInputType.text,
            );
          },
          optionsViewBuilder: (context, onSelectedItem, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 3,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight,
                    maxWidth: maxWidth ?? constraints.maxWidth,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final item = options.elementAt(index);
                      if (itemBuilder != null) {
                        return InkWell(
                          onTap: () => onSelectedItem(item),
                          child: itemBuilder!(item),
                        );
                      }
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        title: Text(
                          displayString(item),
                          style: CustomStyles.black12300,
                        ),
                        onTap: () => onSelectedItem(item),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
