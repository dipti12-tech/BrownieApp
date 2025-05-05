import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/views/LoginScreen.dart';
import 'package:browniepoints/views/OnBoardingStart.dart';
import 'package:browniepoints/widgets/CustomDateInputField.dart';
import 'package:browniepoints/widgets/CustomDropdownField.dart';
import 'package:browniepoints/widgets/CustomLabel.dart';
import 'package:browniepoints/widgets/CustomNumberInputField.dart';
import 'package:flutter/material.dart';
import '../models/Partner.dart';
import '../utils/GeneratePasswdmd5.dart';
import '../utils/SharedPrefs.dart';
import '../utils/colors.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomInputField.dart';

class AccountCreation extends StatefulWidget {
  String source;

  AccountCreation({super.key, required this.source});

  @override
  _AccountCreationState createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  final _formKey = GlobalKey<FormState>();
  bool is18OrOlder = false;
  final emailController = TextEditingController();
  final countryController = TextEditingController(text: "UK");
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final mobileNumberController = TextEditingController(text: "44");

  String selectedDob = "";
  String selectedGender = "";
  GeneratePasswdmd5 generatePasswdmd5 = GeneratePasswdmd5();
  PartnerDetails? partnerDetails;

  @override
  void initState() {
    super.initState();
    print("Coming from screen : ${widget.source}");
    _loadPartnerDetails();
  }

  void _loadPartnerDetails() async {
    partnerDetails = await SharedPrefs().getPartnerDetails();

    if (widget.source == 'invite' && partnerDetails != null) {
      setState(() {
        firstnameController.text = partnerDetails!.firstName;
        lastnameController.text = partnerDetails!.lastName;
        selectedDob = partnerDetails!.dob;
        selectedGender = partnerDetails!.gender;
        countryController.text = partnerDetails!.country;
        cityController.text = partnerDetails!.city;
        mobileNumberController.text = "";
        createPasswordController.text = "";
        confirmPasswordController.text = "";
        is18OrOlder = true;
      });
    } else {
      setState(() {
        firstnameController.clear();
        lastnameController.clear();
        selectedDob = "";
        selectedGender = "";
        countryController.text = "UK";
        cityController.clear();
        mobileNumberController.text = "44";
        createPasswordController.clear();
        confirmPasswordController.clear();
        is18OrOlder = false;
      });
    }
  }

  String _formatDob(String dob) {
    try {
      final parts = dob.split('/');
      if (parts.length == 3) {
        final d = parts[0].padLeft(2, '0');
        final m = parts[1].padLeft(2, '0');
        final y = parts[2];
        return "$y-$m-$d";
      }
      return dob;
    } catch (_) {
      return dob;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
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
                    'assets/images/backbutton.png', // <-- your image path
                    width: 35,
                    height: 35,
                  ),
                  onPressed: () {
                   Navigator.pop(context);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        // <-- Add left padding here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.onboardingTextColor,
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
                        'assets/images/splashscreenart.png',
                        fit: BoxFit.fitHeight,
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
                          CustomInputField(
                            hintText: "Name",
                            icon: Icon(Icons.person_outline),
                            controller: firstnameController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* Last Name"),
                          CustomInputField(
                            hintText: "Last Name",
                            icon: Icon(Icons.person_outline),
                            controller: lastnameController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* Date of Birth"),
                          CustomDateInputField(
                            hintText: "dd/mm/yyyy",
                            icon: Icons.calendar_today,
                            onDateSelected: (value) {
                              setState(() => selectedDob = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* Gender"),
                          CustomDropdownField(
                            hintText: "Gender",
                            items: ["Male", "Female", "Other"],
                            onChanged: (value) {
                              setState(() => selectedGender = value ?? '');
                            },
                          ),
                        ],
                      ),
                    ),
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
                          CustomInputField(
                            hintText: "Enter Country",
                            icon: Icon(Icons.flag_outlined),
                            controller: countryController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabel(text: "* City"),
                          CustomInputField(
                            hintText: "Enter City",
                            icon: Icon(Icons.location_city),
                            controller: cityController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                CustomLabel(text: "* Mobile No."),
                CustomNumberInputField(
                  hintText: "Enter Mob No.",
                  icon: Icon(Icons.phone),
                  controller: mobileNumberController,
                ),
                const SizedBox(height: 15),

                CustomLabel(text: "* Create Password"),
                CustomInputField(
                  hintText: "Enter Password",
                  icon: Icon(Icons.lock_outline),
                  isPassword: true,
                  controller: createPasswordController,
                ),
                const SizedBox(height: 15),

                CustomLabel(text: '* Confirm Password'),
                CustomInputField(
                  hintText: "Confirm Password",
                  icon: Icon(Icons.lock_outline),
                  isPassword: true,
                  controller: confirmPasswordController,
                ),
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
                    text: AppStrings.btncontinue,
                    backgroundColor: AppColors.btnGetstarted,
                    textColor: AppColors.btnInvite,
                    onPressed: () async {
                      if (createPasswordController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Passwords do not match"),
                          ),
                        );
                        return;
                      } else {
                        String password = generatePasswdmd5.generateMd5hash(
                          confirmPasswordController.text,
                        );
                        await SharedPrefs().updateSignUpRequest({
                          "first_name": firstnameController.text,
                          "last_name": lastnameController.text,
                          "country": countryController.text,
                          "city": cityController.text,
                          "password": password,
                          "gender": selectedGender,
                          "dob": _formatDob(selectedDob),
                          "gender": selectedGender,
                          "phone": mobileNumberController.text,
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnBoardingStart(source:widget.source),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
