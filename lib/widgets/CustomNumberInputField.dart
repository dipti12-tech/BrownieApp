import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumberInputField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final TextEditingController controller;
  final String prefix;

  const CustomNumberInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.prefix = "44",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FixedPrefixNumberFormatter(prefix: prefix),
        ],
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: (value) => value!.isEmpty ? "Required" : null,
      ),
    );
  }
}



class FixedPrefixNumberFormatter extends TextInputFormatter {
  final String prefix;

  FixedPrefixNumberFormatter({this.prefix = "44"});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Block edits that remove or change the prefix
    if (!newValue.text.startsWith(prefix)) {
      return oldValue;
    }

    // Remove all non-digit characters
    final filtered = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Ensure it still starts with prefix after filtering
    if (!filtered.startsWith(prefix)) {
      return oldValue;
    }

    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}
