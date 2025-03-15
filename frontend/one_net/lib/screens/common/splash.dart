import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/homeScreen.dart';  
import '../Auth/signin.dart';
import '../../config/themes/theme.dart';  

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      bool isLoggedIn = true; // Replace with actual login check logic
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn ? const HomeScreen() : const SignIn(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
                radius: 35,
              )
            : CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColor.primary,
              ),
      ),
    );
  }
}
