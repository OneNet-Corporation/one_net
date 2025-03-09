import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Un'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Sign Un screen'),
      ),
    );
  }
}
