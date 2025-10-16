import 'package:flutter/material.dart';

class SearchDropdown<T extends Object> extends StatelessWidget {
  final List<T> items;
  final String hintText;
  final String Function(T) displayString;
  final void Function(T) onSelected;
  final Widget Function(T) itemBuilder;
  final TextEditingController? controller;
  final double maxHeight;
  final double? maxWidth;

  const SearchDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.displayString,
    required this.onSelected,
    required this.itemBuilder,
    this.controller,
    this.maxHeight = 300,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return items;
        }
        return items.where((item) => displayString(item)
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      displayStringForOption: (T item) => displayString(item),
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controller ?? textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.search),
          ),
        );
      },
      optionsViewBuilder: (context, onSelectedCallback, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              height: maxHeight,
              width: maxWidth ?? MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final T option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelectedCallback(option),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: itemBuilder(option),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: onSelected,
    );
  }
}
