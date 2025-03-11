import 'package:flutter/material.dart';
import 'package:one_net/screens/Auth/forgetPassword_screen.dart'; 
import 'package:one_net/screens/Auth/signin.dart'; 
import 'package:one_net/screens/Auth/signup.dart'; 
import 'package:one_net/screens/common/splash.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => const SplashPage(),
    };
  }

  static void sendNavigationEventToFirebase(String? path) {
    if (path != null && path.isNotEmpty) {}
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name!.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "SignIn":
        return MaterialPageRoute(builder: (BuildContext context) => SignIn());
      case "SignUp":
        return MaterialPageRoute(builder: (BuildContext context) => SignUp());
      case "ForgetPasswordPage":
        return MaterialPageRoute(
        builder: (BuildContext context) => const ForgetPasswordScreen());
      
      default:
        return onUnknownRoute(const RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            settings.name!.split('/')[1],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name!.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}
