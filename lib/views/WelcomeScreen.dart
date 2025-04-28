import 'package:browniepoints/views/LoginScreen.dart';
import 'package:browniepoints/views/LoginScreenNew.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/CustomButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const[
                          SizedBox(height: 40),
                          Text(
                            'Welcome to',
                            style: TextStyle(fontSize: 20, color: AppColors.onboardingOptionTextColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Brownie Pointss',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onboardingOptionTextColor,
                              fontFamily: 'Cursive', // You can use a Google Fonts package for this.
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'A celebration of your love',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                  )
                ],
              ),
               Image.asset(
                'assets/images/ic_welcome.png',
                height: 340,
                width: 240,
                fit: BoxFit.contain,

              ),
              Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: CustomButton(
                      text: 'Get Started',
                      backgroundColor: AppColors.btnGetstarted,
                      textColor: AppColors.btnInvite,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreenNew(isInvite: false,)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 35,
                    child: CustomButton(
                      text: 'I Have an Invitation Code',
                      backgroundColor: AppColors.btnInvite,
                      textColor: AppColors.btnGetstarted,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreenNew(isInvite: true,)),
                        );
                      },
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
