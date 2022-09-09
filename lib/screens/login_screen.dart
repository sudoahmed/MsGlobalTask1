import 'package:flutter/material.dart';
import 'package:ms_global_task1/components/custom_button.dart';
import 'package:ms_global_task1/components/custom_textfield.dart';
import 'package:ms_global_task1/constants/color_constants.dart';
import 'package:ms_global_task1/services/authService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splashLogo.jpeg',
              width: 150,
            ),
            SizedBox(
              width: _width * 0.9,
              child: CustomTextField(
                hintText: 'Email',
                hintTextColor: Colors.grey,
                textController: emailController,
                onChangeFunction: (value) {
                  emailController.text = value;
                },
              ),
            ),
            SizedBox(
              width: _width * 0.9,
              child: CustomTextField(
                hintText: 'Password',
                passwordField: _showPass,
                hintTextColor: Colors.grey,
                textController: passController,
                suffixIcon: InkWell(
                  child: const Icon(
                    Icons.visibility,
                    size: 25,
                  ),
                  onTap: () {
                    setState(() {
                      _showPass = !_showPass;
                    });
                  },
                ),
                onChangeFunction: (value) {
                  passController.text = value;
                },
              ),
            ),
            CustomButton(
              buttonText: 'Login',
              buttonColor: kDefaultButtonColor,
              desiredWidth: 250,
              buttonFunction: () {
                AuthService()
                    .authenticate(emailController.text, passController.text);
                // print(emailController.text);
                // print(passController.text);
              },
            )
          ],
        ),
      )),
    );
  }
}
