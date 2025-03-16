import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:one_net/core/constants/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;
  bool _isUsernameEmpty = false;
  bool _isFirstNameEmpty = false;
  bool _isLastNameEmpty = false;
  bool _isGenderEmpty = false;
  bool _isPasswordHidden = true;

  Future<void> _signUp() async {
    setState(() {
      _isEmailEmpty = emailController.text.isEmpty;
      _isPasswordEmpty = passwordController.text.isEmpty;
      _isUsernameEmpty = usernameController.text.isEmpty;
      _isFirstNameEmpty = firstNameController.text.isEmpty;
      _isLastNameEmpty = lastNameController.text.isEmpty;
      _isGenderEmpty = genderController.text.isEmpty;
    });

    if (!_isEmailEmpty &&
        !_isPasswordEmpty &&
        !_isUsernameEmpty &&
        !_isFirstNameEmpty &&
        !_isLastNameEmpty &&
        !_isGenderEmpty) {
      final response = await http.post(
        Uri.parse('http://localhost:3000/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usernameController.text,
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'gender': genderController.text,
        }),
      );

      if (response.statusCode == 201) {
        // If the server returns a 201 CREATED response,
        // navigate to the home screen
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/HomeScreen',
          (Route<dynamic> route) => false,
        );
      } else {
        // If the server did not return a 201 CREATED response,
        // show an error message
        final responseJson = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseJson['message'])),
        );
      }
    }
  }

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Username',
                  style: bodySmall(context),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: usernameController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter your username...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isUsernameEmpty ? errorColor : lightGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isUsernameEmpty ? errorColor : lightGray),
                    ),
                    hintStyle: hintText(context).copyWith(color: hintColor),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'First Name',
                  style: bodySmall(context),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: firstNameController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter your first name...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isFirstNameEmpty ? errorColor : lightGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isFirstNameEmpty ? errorColor : lightGray),
                    ),
                    hintStyle: hintText(context).copyWith(color: hintColor),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Last Name',
                  style: bodySmall(context),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: lastNameController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter your last name...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isLastNameEmpty ? errorColor : lightGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isLastNameEmpty ? errorColor : lightGray),
                    ),
                    hintStyle: hintText(context).copyWith(color: hintColor),
                  ),
                ),
                SizedBox(height: 16),
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
                  obscureText: _isPasswordHidden,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: hintColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Gender',
                  style: bodySmall(context),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: genderController.text.isEmpty
                      ? null
                      : genderController.text,
                  items: ['Male', 'Female', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  style: hintText(context).copyWith(color: defaultTextColor),
                  dropdownColor: defaultBackgroundColor,
                  onChanged: (newValue) {
                    setState(() {
                      genderController.text = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Select your gender...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isGenderEmpty ? errorColor : lightGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isGenderEmpty ? errorColor : lightGray),
                    ),
                    hintStyle: hintText(context).copyWith(color: hintColor),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, 48),
                  ),
                  child: Text('Sign Up',
                      style: buttonText(context)
                          .copyWith(color: defaultBackgroundColor)),
                ),
                SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: hintText(context).copyWith(fontSize: 14)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/SignIn',
                            (Route<dynamic> route) => false,
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'Login',
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
      ),
    );
  }
}
