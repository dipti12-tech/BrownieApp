
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class CustomButtonQuestionaries extends StatelessWidget {

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomButtonQuestionaries({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          side: BorderSide(color: isSelected ? AppColors.btnInvite : Colors.black),
          backgroundColor: isSelected ? AppColors.btnInvite : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: isSelected ? Colors.white : AppColors.splashBg,
          ),
        ),
      ),
    );
  }
}
