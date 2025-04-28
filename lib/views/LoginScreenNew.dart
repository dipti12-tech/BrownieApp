import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:browniepoints/views/AccountCreation.dart';
import 'package:browniepoints/widgets/CustomButton.dart';
import 'package:browniepoints/widgets/CustomInputField.dart';
import 'package:browniepoints/widgets/CustomLabel.dart';
import 'package:flutter/material.dart';

class LoginScreenNew extends StatelessWidget {
  final bool isInvite;
  const LoginScreenNew({super.key, this.isInvite = false});

  @override
  Widget build(BuildContext context) {
    final labelText = isInvite ? "* Invitation Code" : "* Email Address";
    final hintText = isInvite ? "Code" : "Email";
    final firstText = isInvite ? "Your partner is waiting for you to\njoin them" : "Your journey to a more fulfilling\nrelationship begins here";

    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/backbutton.png',  // <-- your image path
                  width: 35,
                  height: 35,
                ),
              ),
              const SizedBox(height: 10),

              // Heading text
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstText,
                      style: TextStyle(
                        color: AppColors.onboardingTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "We’re happy to see you",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Image (you can replace with actual asset or network image)
              Center(
                child: Image.asset(
                  'assets/images/ic_welcome.png', // Add this image in your assets
                  height: 340,
                  width: 240,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // Email TextField
              CustomLabel(text: labelText),
              const SizedBox(height: 6),
              CustomInputField(hintText: hintText, icon: Icons.alternate_email_rounded),
              const SizedBox(height: 30),

              // Continue Button
              SizedBox(
                height: 35,
                width: double.infinity,
                child: CustomButton(
                  text: AppStrings.btncontinue,
                  backgroundColor: AppColors.btnGetstarted,
                  textColor: AppColors.btnInvite,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountCreation()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}