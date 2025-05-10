import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:browniepoints/views/OnBoardingSecond.dart';
import 'package:browniepoints/widgets/CustomButtonQuestionaries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/SharedPrefs.dart';

class OnBoardingStart extends  StatefulWidget{
  String source;

  OnBoardingStart({super.key,required this.source});

  @override
    _OnBoardingStartState createState() => _OnBoardingStartState();
  }
  class _OnBoardingStartState extends State<OnBoardingStart> {
    String? selectedAnswer;

    void saveSelectedAnswer() async {
      if (selectedAnswer != null) {
        await SharedPrefs().updateSignUpRequest(
            {"relationship_status": selectedAnswer}
        );
      }
    }

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
                          'assets/images/backbutton.png',  // <-- your image path
                          width: 35,
                          height: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.radio_button_checked_sharp, color: AppColors.splashBg, size: 16),
                          const SizedBox(width: 8),
                          Container(height: 2, width: 50, color: Colors.grey[400]),
                          const SizedBox(width: 8),
                          const Icon(Icons.circle, color: Colors.grey, size: 8),
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
                    ),

                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  AppStrings.questiontextstep2,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                 AppStrings.questiontextstep3,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: AppColors.onboardingTextColor,
                  ),
                ),

                const SizedBox(height: 180),

                CustomButtonQuestionaries(
                  text: AppStrings.answelive,
                  isSelected: selectedAnswer == AppStrings.answelive,
                  onTap: () {
                    setState(() {
                      selectedAnswer = AppStrings.answelive;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomButtonQuestionaries(
                  text: AppStrings.anstowncity,
                  isSelected: selectedAnswer == AppStrings.anstowncity,
                  onTap: () {
                    setState(() {
                      selectedAnswer = AppStrings.anstowncity;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomButtonQuestionaries(
                  text: AppStrings.anstownscities,
                  isSelected: selectedAnswer == AppStrings.anstownscities,
                  onTap: () {
                    setState(() {
                      selectedAnswer = AppStrings.anstownscities;
                    });
                  },
                ),

                const Spacer(),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await SharedPrefs().updateSignUpRequest(
                              {"relationship_status": ""}
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OnBoardingSecond(source: widget.source)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btnInvite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: AppColors.btnInvite,
                            ),
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
                          saveSelectedAnswer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OnBoardingSecond(source: widget.source)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btnGetstarted,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: AppColors.btnInvite,

                            )
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
