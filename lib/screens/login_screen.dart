import 'package:flutter/material.dart';
import 'package:ms_global_task1/components/custom_button.dart';
import 'package:ms_global_task1/components/custom_textfield.dart';
import 'package:ms_global_task1/constants/color_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPass = true;
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
              child: const CustomTextField(
                  hintText: 'Email', hintTextColor: Colors.grey),
            ),
            SizedBox(
              width: _width * 0.9,
              child: CustomTextField(
                hintText: 'Password',
                passwordField: _showPass,
                hintTextColor: Colors.grey,
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
              ),
            ),
            CustomButton(
                buttonText: 'Login',
                buttonColor: kDefaultButtonColor,
                buttonFunction: () {},
                desiredWidth: 250)
          ],
        ),
      )),
    );
  }
}
