import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomInputField({
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 20),
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