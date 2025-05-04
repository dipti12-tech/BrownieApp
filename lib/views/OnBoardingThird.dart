import 'package:browniepoints/views/OnBoardingFour.dart';
import 'package:flutter/cupertino.dart';
import 'package:browniepoints/views/OnBoardingThird.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/SharedPrefs.dart';
import '../utils/appstring.dart';
import '../utils/colors.dart';
import '../viewmodels/SignupViewModel.dart';
import '../widgets/CustomButtonQuestionaries.dart';

class OnBoardingThird extends StatefulWidget {
  String source;
  OnBoardingThird({super.key,required this.source});
  @override
  _OnBoardingThirdState createState() => _OnBoardingThirdState();
}

class _OnBoardingThirdState extends State<OnBoardingThird> {
  String? selectedAnswer;

  void saveSelectedAnswer() async {
    if (selectedAnswer != null) {
      await SharedPrefs().updateSignUpRequest({
        "share_updates": selectedAnswer,
      });
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
                        Icon(
                          Icons.check_circle,
                          color: AppColors.splashBg,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 2,
                          width: 50,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.splashBg,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 2,
                          width: 50,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.radio_button_checked,
                          color: AppColors.splashBg,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 2,
                          width: 50,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.circle, color: Colors.grey, size: 8),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                AppStrings.questionstep4,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                AppStrings.questionstep5,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: AppColors.onboardingTextColor,
                ),
              ),

              const SizedBox(height: 16),
              Text(
                AppStrings.questionstep6,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: AppColors.emailaddress,
                ),
              ),
              const SizedBox(height: 150),

              CustomButtonQuestionaries(
                text: AppStrings.ansonlymypartner,
                isSelected: selectedAnswer == AppStrings.ansonlymypartner,
                onTap: () {
                  setState(() {
                    selectedAnswer = AppStrings.ansonlymypartner;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomButtonQuestionaries(
                text: AppStrings.ansmyfriends,
                isSelected: selectedAnswer == AppStrings.ansmyfriends,
                onTap: () {
                  setState(() {
                    selectedAnswer = AppStrings.ansmyfriends;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomButtonQuestionaries(
                text: AppStrings.anseveryone,
                isSelected: selectedAnswer == AppStrings.anseveryone,
                onTap: () {
                  setState(() {
                    selectedAnswer = AppStrings.anseveryone;
                  });
                },
              ),

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
                      onPressed: () async {
                        saveSelectedAnswer();
                        if(widget.source=='invite'){

                          print("dONT SHOW INVITE SCREEN");

                          final signUpRequest =  await SharedPrefs().getSignUpRequest();
                          if (signUpRequest != null) {
                            print("SignUp Request Data:\n${signUpRequest.toJson()}");
                            final viewModel = Provider.of<SignUpViewModel>(context, listen: false);
                            try{
                              await viewModel.signUp(signUpRequest);
                              final response = viewModel.response;

                              print(response?.message );
                              print(response?.message );

                              if (response != null && response.status == 1) {
                                print("SignUp Success:\n${response.toString()}");
                                Fluttertoast.showToast(
                                  msg: "Signup successful!",
                                  backgroundColor: Colors.green,
                                );
                              }
                              else {
                                print("SignUp Failed:\n$response");
                                Fluttertoast.showToast(
                                  msg: "Signup failed",
                                  backgroundColor: Colors.red,
                                );
                              }
                            }catch (e) {
                              print("Exception during signup: $e");
                              Fluttertoast.showToast(
                                msg: "Signup error",
                                backgroundColor: Colors.red,
                              );
                            }
                          }
                          else {
                            Fluttertoast.showToast(
                              msg: "Incomplete signup data",
                              backgroundColor: Colors.orange,
                            );
                          }

                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnBoardingFour(),
                            ),
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnGetstarted,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: AppColors.btnInvite),
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
