import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Sign In screen'),
      ),
    );
  }
}
