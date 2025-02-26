import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List items;
  final dynamic value;
  final String hintText;
  final ValueChanged onChanged;
  final String Function(dynamic)? itemLabel;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final bool? isFilled;
  final Color? fillColor;
  final double? borderRadius;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hintText = "Select an option",
    this.itemLabel,
    this.decoration,
    this.contentPadding,
    this.icon,
    this.isFilled,
    this.fillColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      icon: icon ?? Icon(Icons.arrow_drop_down),
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            fillColor: fillColor ?? Colors.white,
            filled: isFilled ?? false,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
          ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(itemLabel != null ? itemLabel!(item) : item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
