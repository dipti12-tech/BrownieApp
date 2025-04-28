
import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:browniepoints/views/OnBoardingStart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return _LoginScreenState();
  }

}

class _LoginScreenState extends State<LoginScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30,60,0,0),
              child: Image.asset('assets/images/backbutton.png'),
              width: 38,
              height: 38,
            ),

            Container(
              padding: EdgeInsets.fromLTRB(50,15,0,0),
              child: Text(
                AppStrings.loginTitle,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: AppColors.onboardingTextColor
                ),
              ),

            ),
Container(
    padding: EdgeInsets.fromLTRB(50,0,0,0),
    child: Text(
    AppStrings.loginSubTitle,
    style: GoogleFonts.archivoBlack(
    fontSize: 12,
    color: Colors.black
    ),
    ),


  ),

            Container(
              margin: EdgeInsets.fromLTRB(30,300,0,0),
              child: Text(
                AppStrings.emailaddress,
                style: TextStyle(color: AppColors.emailaddress, fontSize: 16),
              ),


            ),
            Container(

    margin: const EdgeInsets.only(top: 5, left: 16, right: 16),
            child: TextFormField(
              initialValue: 'john.appleseed@gmail.com',
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.alternate_email),
                hintText: AppStrings.emailaddress,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
              ),

            ),


    ),
            Container(

              margin: EdgeInsets.fromLTRB(30,20,0,0),
              child: Text(
                AppStrings.password,
                style: TextStyle(color: AppColors.emailaddress, fontSize: 16),
              ),


            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 16, right: 16),

              child:  TextFormField(
                obscureText: true,
                initialValue: '********',
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                ),
              ),


            ),
            const SizedBox(height: 30),

            Container(
              margin: const EdgeInsets.only(top: 24, left: 16, right: 16), // margin added here
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnBoardingStart()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnGetstarted,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: Text(
                    AppStrings.btncontinue,
                    style: GoogleFonts.roboto(
                      color: AppColors.btnInvite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      );
  }
}