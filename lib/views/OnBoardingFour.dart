import 'package:browniepoints/views/OnBoardingFour.dart';
import 'package:browniepoints/widgets/CustomInviteField.dart';
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
import '../widgets/CustomInputField.dart';
import '../widgets/CustomLabel.dart';

class OnBoardingFour extends StatefulWidget {
  @override
  _OnBoardingFourState createState() => _OnBoardingFourState();
}

class _OnBoardingFourState extends State<OnBoardingFour> {
  final emailController = TextEditingController();
  final partnerFirstName = TextEditingController();
  final partnerLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: SafeArea  (
        child: SingleChildScrollView(

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
                        const Icon(Icons.check_circle, color: AppColors.splashBg, size: 16),
                        const SizedBox(width: 8),
                        Container(height: 2, width: 50, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        const Icon(Icons.check_circle, color:AppColors.splashBg, size: 16),
                        const SizedBox(width: 8),
                        Container(height: 2, width: 50, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        const Icon(Icons.radio_button_checked, color: AppColors.splashBg, size: 16),
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 32),

              Text(
                AppStrings.questioninvite5,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                AppStrings.questioninvite6,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: AppColors.onboardingTextColor,
                ),
              ),

              const SizedBox(height: 200),



              // Third Row: Country & City
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabel(text: AppStrings.theirFirstName),
                        CustomInviteField(hintText: "Name", controller: partnerFirstName,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabel(text: AppStrings.theirLastname),
                        CustomInviteField(hintText: "Surname", controller: partnerLastName,),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),

              Container(
                child: Text(
                  AppStrings.theiremailaddress,
                  style: TextStyle(color: AppColors.emailaddress, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                // margin left & right
                child: CustomInputField(
                  hintText: "john.appleseed@gmail.com",
                  icon: Icon(Icons.alternate_email_rounded),
                  controller: emailController,
                ),
              ),
              const SizedBox(height: 30),

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
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async{
                        await SharedPrefs().updateSignUpRequest({
                          "partner_first_name": partnerFirstName.text,
                          "partner_last_name": partnerLastName.text,
                          "partner_email_id": emailController.text,
                        });

                        final signUpRequest = await SharedPrefs().getSignUpRequest();
                        if (signUpRequest != null) {
                          print("📤 SignUp Request Data:\n${signUpRequest.toJson()}");
                          final viewModel = Provider.of<SignUpViewModel>(context, listen: false);
                          try{
                            await viewModel.signUp(signUpRequest);
                            final response = viewModel.response;

                            if (response != null && response.status == 200) {
                              print("✅ SignUp Success:\n${response.toString()}");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Signup successful!")),
                              );
                            }
                            else {
                              // Show error message
                              print("❌ SignUp Failed:\n$response");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Signup failed: Unknown error")),
                              );
                            }
                          }catch (e) {
                            print("🔥 Exception during signup: $e");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Signup error: ")),
                            );
                            Fluttertoast.showToast(
                                msg: "Signup error: $e",
                                backgroundColor: Colors.red,
                            );
                          }
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Signup successful!")),
                          );
                          Fluttertoast.showToast(
                            msg: "Incomplete signup data",
                            backgroundColor: Colors.orange,
                          );
                        }

                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnBoardingFour(),
                          ),
                        );*/
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
      ),
    );
  }
}
