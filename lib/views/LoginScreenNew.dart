import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:browniepoints/viewmodels/InviteViewModel.dart';
import 'package:browniepoints/widgets/CustomButton.dart';
import 'package:browniepoints/widgets/CustomInputField.dart';
import 'package:browniepoints/widgets/CustomLabel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/SharedPrefs.dart';
import '../viewmodels/LoginUserExistsViewModel.dart';

class LoginScreenNew extends StatelessWidget {
  final bool isInvite;

  LoginScreenNew({super.key, this.isInvite = false});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController inviteController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final labelText = isInvite ? "* Invitation Code" : "* Email Address";
    final hintText = isInvite ? "Code" : "Email";
    final firstText =
        isInvite
            ? "Your partner is waiting for you to\njoin them"
            : "Your journey to a more fulfilling\nrelationship begins here";
    final TextEditingController inputController = isInvite ? inviteController : emailController;

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
                  'assets/images/backbutton.png', // <-- your image path
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

              Center(
                child: Image.asset(
                  'assets/images/ic_welcome.png',
                  height: 340,
                  width: 240,
                  fit: BoxFit.contain,
                  color: AppColors.onboardingTextColor.withOpacity(0.5),
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),

              const SizedBox(height: 30),

              // Email TextField
              CustomLabel(text: labelText),
              const SizedBox(height: 6),
              CustomInputField(
                hintText: hintText,
                controller: inputController,
                icon: isInvite
                    ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/ic_code.png',
                  ),
                )
                    : Icon(Icons.alternate_email_rounded),
              ),
              const SizedBox(height: 30),

              SizedBox(
                height: 35,
                width: double.infinity,
                child: CustomButton(
                  text: AppStrings.btncontinue,
                  backgroundColor: AppColors.btnGetstarted,
                  textColor: AppColors.btnInvite,
                  onPressed: () async{
                    if (isInvite) {
                      print("INVITE@@$isInvite");
                      String invitecode = inviteController.text.trim();
                      final viewModel = Provider.of<InviteViewModel>(
                        context,
                        listen: false,
                      );
                      viewModel.checkInviteCode(context, invitecode);
                    } else {
                    String email = emailController.text.trim();
                    if (email.isNotEmpty) {
                      await SharedPrefs().updateSignUpRequest({
                        "email_id": emailController.text,
                      });
                        print("email entered@@$email");
                        final viewModel = Provider.of<LoginUserExistsViewModel>(
                          context,
                          listen: false,
                        );
                        viewModel.checkUserExists(context, email);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(AppStrings.enteremail)),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
