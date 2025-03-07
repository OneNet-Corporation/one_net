import 'package:flutter/material.dart';
import 'package:one_net/core/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/onenet_logo.png', height: 24),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: defaultBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Email',
                style: bodySmall(context),
              ),
              SizedBox(height: 8),
              TextField(
                controller: emailController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter your email address...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: _isEmailEmpty ? errorColor : lightGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: _isEmailEmpty ? errorColor : lightGray),
                  ),
                  hintStyle: hintText(context).copyWith(color: hintColor),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Password',
                style: bodySmall(context),
              ),
              SizedBox(height: 8),
              TextField(
                controller: passwordController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: _isPasswordEmpty ? errorColor : lightGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: _isPasswordEmpty ? errorColor : lightGray),
                  ),
                  hintStyle: hintText(context).copyWith(color: hintColor),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      side: BorderSide(color: primaryColor, width: 1.5),
                      activeColor: primaryColor,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Text('Keep me logged in',
                      style: hintText(context).copyWith(fontSize: 13)),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot password?',
                        style: bodySmall(context)
                            .copyWith(color: primaryColor, fontSize: 13)),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEmailEmpty = emailController.text.isEmpty;
                    _isPasswordEmpty = passwordController.text.isEmpty;
                  });

                  if (!_isEmailEmpty && !_isPasswordEmpty) {
                    // Proceed with login
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text('Login',
                    style: buttonText(context)
                        .copyWith(color: defaultBackgroundColor)),
              ),
              SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: hintText(context).copyWith(fontSize: 14)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 4)),
                      child: Text(
                        'Create an account',
                        style:
                            buttonText(context).copyWith(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
