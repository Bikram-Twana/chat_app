import 'dart:async';

import 'package:chat_app/auth/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
//Navigates to new screen after 5 seconds.
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // initState() {
    //   Future.delayed(Duration(seconds: 4), () {
    //     Navigator.pushReplacement(this.context,
    //         MaterialPageRoute(builder: (context) {
    //       return LoginSignUp();
    //     }));
    //   });
    // }

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
