import 'dart:async';
import 'package:festi/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFesti.AzulFesti,
      body: Center(
        child: Image.asset('assets/images/logo_splash.png'),
      ),
    );
  }
}