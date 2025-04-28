import 'package:browniepoints/views/OnBoardingThird.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/appstring.dart';
import '../utils/colors.dart';
import '../widgets/CustomButtonQuestionaries.dart';

class OnBoardingSecond extends StatefulWidget {
  @override
  _OnBoardingSecondState createState() => _OnBoardingSecondState();
}

class _OnBoardingSecondState extends State<OnBoardingSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/images/backbutton.png', // <-- your image path
                      width: 35,
                      height: 35,
                    ),
                    onPressed: () {},
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: AppColors.splashBg, size: 16),
                        const SizedBox(width: 8),
                        Container(height: 2, width: 50, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        const Icon(Icons.radio_button_checked_rounded, color:AppColors.splashBg, size: 16),
                        const SizedBox(width: 8),
                        Container(height: 2, width: 50, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        const Icon(Icons.circle, color: Colors.grey, size: 8),
                        const SizedBox(width: 8),
                        Container(height: 2, width: 50, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        const Icon(Icons.circle, color: Colors.grey, size: 8),
                      ],
                    ),
                  )
                  ,
                ],
              ),
              const SizedBox(height: 32),
              Text(
                AppStrings.questiontext4,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                AppStrings.questiontext5,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: AppColors.onboardingTextColor,
                ),
              ),

              const SizedBox(height: 230),

              CustomButtonQuestionaries(text: AppStrings.ansmypartner),
              const SizedBox(height: 16),
              CustomButtonQuestionaries(text: AppStrings.ansrealtionship),
              const SizedBox(height: 16),
              CustomButtonQuestionaries(text: AppStrings.ansplans),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnInvite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      child: Text(
                        AppStrings.skip,
                        style: GoogleFonts.roboto(
                          color: AppColors.btnGetstarted,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnBoardingThird()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnGetstarted,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: AppColors.btnInvite,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      child: Text(
                        AppStrings.btncontinue,
                        style: GoogleFonts.roboto(
                          color: AppColors.btnInvite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
