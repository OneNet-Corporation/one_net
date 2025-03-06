import 'package:flutter/material.dart';
import 'package:one_net/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter your email address...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: lightGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent),
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
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: lightGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: hintText(context).copyWith(color: hintColor),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      Text('Keep me logged in',
                          style: hintText(context).copyWith(fontSize: 13)),
                    ],
                  ),
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
                onPressed: () {},
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
