import 'package:browniepoints/widgets/CustomDateInputField.dart';
import 'package:browniepoints/widgets/CustomDropdownField.dart';
import 'package:browniepoints/widgets/CustomInputField.dart';
import 'package:browniepoints/widgets/CustomLabel.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomButton.dart';

class AccountCreation extends StatefulWidget {
  @override
  _AccountCreationState createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  final _formKey = GlobalKey<FormState>();
  bool is18OrOlder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDECCE), // Light peach background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/backbutton.png',  // <-- your image path
                    width: 35,
                    height: 35,
                  ),
                  onPressed: () {},
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.0), // <-- Add left padding here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Let's get you set up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 5),
                    SizedBox(
                      height: 150, // Adjust size based on your image
                      width: 130,
                      child: Image.asset(
                        'assets/images/splashscreenart.png',  // <-- put your image in assets folder
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                // First Row: First Name & Last Name
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* First Name"),
                          CustomInputField(hintText: "Name", icon: Icons.person_outline),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomLabel(text: "* Last Name"),
                            CustomInputField(hintText: "Last Name", icon: Icons.person_outline),
                          ],
                        )
                    )
                  ],
                ),
                const SizedBox(height: 15),

                // Second Row: DOB & Gender
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* Date of Birth"),
                          CustomDateInputField(hintText: "dd/mm/yyyy", icon: Icons.calendar_today)
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* Gender"),
                          CustomDropdownField(hintText: "Gender", items: ["Male", "Female", "Other"]),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                // Third Row: Country & City
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* Country"),
                          CustomInputField(hintText: "Enter Country", icon: Icons.flag_outlined),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* City"),
                          CustomInputField(hintText: "Enter City", icon: Icons.location_city),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),

                CustomLabel(text: "* Create Password"),
                CustomInputField(hintText: "Enter Password", icon: Icons.lock_outline, isPassword: true),
                const SizedBox(height: 15),

                CustomLabel(text: '* Confirm Password',),
                CustomInputField(hintText: "Confirm Password", icon: Icons.lock_outline, isPassword: true),
                const SizedBox(height: 15),

                // Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: is18OrOlder,
                      onChanged: (value) {
                        setState(() {
                          is18OrOlder = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "I am 18 years of age or older and agree to the Brownie Pointss Terms & Conditions and Privacy Policy",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Continue Button
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Continue',
                    backgroundColor: const Color(0xFFB7F58C),
                    textColor: Colors.black,
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
      ),
    );
  }
}



