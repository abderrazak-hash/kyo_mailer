import 'package:flutter/material.dart';
import 'package:junction/constants.dart';
import 'package:junction/screens/login_screen.dart';
import 'package:junction/screens/signup_screen.dart';

import 'widgets/pe_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainClr,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/kyo.png',
                  width: 150.0,
                ),
                Image.asset('assets/welcome.png'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Text(
                      'Welcome to\nKYO Conseil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PeButton(
                    width: 180.0,
                    label: 'Sign in',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  PeButton(
                    width: 180.0,
                    label: 'Sign up',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
