import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/homePage.dart';
import '../Auth/loginScreen.dart';
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
      bool isLoggedIn =
          checkLoginStatus(); // Replace with actual login check logic
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn
              ? HomePage(
                  scaffoldKey: GlobalKey<ScaffoldState>(),
                  refreshIndicatorKey: GlobalKey<RefreshIndicatorState>(),
                )
              : LoginScreen(),
        ),
      );
    });
  }

  bool checkLoginStatus() {
    // Replace with actual login check logic
    return false;
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
