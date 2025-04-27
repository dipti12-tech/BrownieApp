import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String hintText;
  final List<String> items;

  const CustomDropdownField({
    required this.hintText,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 12)),
          );
        }).toList(),
        onChanged: (value) {},
        validator: (value) => value == null ? "Required" : null,
      ),
    );
  }
}