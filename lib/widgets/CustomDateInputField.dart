import 'package:flutter/material.dart';

class CustomDateInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final Function(String)? onDateSelected;

  const CustomDateInputField({
    required this.hintText,
    required this.icon,
    this.onDateSelected,
    super.key,
  });

  @override
  State<CustomDateInputField> createState() => _CustomDateInputFieldState();
}

class _CustomDateInputFieldState extends State<CustomDateInputField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            String formatted = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
            controller.text = formatted;
            widget.onDateSelected?.call(formatted);
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, size: 20),
          hintText: widget.hintText,
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