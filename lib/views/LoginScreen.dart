import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:browniepoints/views/AccountCreation.dart';
import 'package:browniepoints/views/OnBoardingStart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/SharedPrefs.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomInputField.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 60, 0, 0),
            child: Image.asset('assets/images/backbutton.png'),
            width: 38,
            height: 38,
          ),

          Container(
            padding: EdgeInsets.fromLTRB(50, 15, 0, 0),
            child: Text(
              AppStrings.loginTitle,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: AppColors.onboardingTextColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Text(
              AppStrings.loginSubTitle,
              style: GoogleFonts.archivoBlack(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 180,
              height: 180,
              child: Image.asset('assets/images/splashscreenart.png'),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(30, 200, 0, 0),
            child: Text(
              AppStrings.emailaddress,
              style: TextStyle(color: AppColors.emailaddress, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomInputField(
              hintText: "john.appleseed@gmail.com",
              icon:Icon(Icons.alternate_email_rounded),
              controller: emailController,
            ),
          ),
          const SizedBox(height: 30),

          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              AppStrings.password,
              style: TextStyle(color: AppColors.emailaddress, fontSize: 14),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomInputField(
              hintText: "**********",
              icon: Icon(Icons.password_rounded),
              controller: passwordController,

            ),
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 35,
              width: double.infinity,
              child: CustomButton(
                text: AppStrings.btncontinue,
                backgroundColor: AppColors.btnGetstarted,
                textColor: AppColors.btnInvite,
                onPressed: () async{
                  await SharedPrefs().updateSignUpRequest(
                    {"relationship_status": emailController.text}
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountCreation()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
