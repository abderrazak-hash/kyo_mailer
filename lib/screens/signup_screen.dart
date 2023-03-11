import 'package:flutter/material.dart';
import 'package:junction/constants.dart';
import 'package:junction/screens/chat_screen.dart';
import 'package:junction/screens/widgets/input_text.dart';

import 'widgets/pe_button.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainClr,
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Image.asset(
              'assets/kyo.png',
              width: 150.0,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Create an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   Full Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 300.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        child: PeInput(
                          hintText: 'Full Name',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   Email',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 300.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        child: PeInput(
                          hintText: 'Email',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 300.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        child: PeInput(
                          hintText: 'Password',
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: PeButton(
                      width: 180.0,
                      label: 'Sign in',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: const [
                      Divider(
                        height: 50.0,
                        thickness: 10,
                        color: black,
                      ),
                      Text(
                        'Or sign in with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Divider(
                        indent: 100.0,
                        thickness: 2,
                        color: black,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      'google',
                      'apple',
                      'facebook',
                      'twitter',
                    ]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/$e.png'),
                          ),
                        )
                        .toList(),
                  ),
                  const Text(
                    'Have an account, Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
