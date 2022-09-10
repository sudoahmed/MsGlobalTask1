import 'package:flutter/material.dart';
import 'package:ms_global_task1/components/custom_button.dart';
import 'package:ms_global_task1/components/custom_textfield.dart';
import 'package:ms_global_task1/constants/color_constants.dart';
import 'package:ms_global_task1/services/authService.dart';
import 'package:provider/provider.dart';

import '../provider/json_data_provider.dart';
import '../services/postFetchService.dart';

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
    final jsonData = Provider.of<JsonDataProvider>(context);
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
              buttonFunction: () async {
                if (await AuthService().authenticate(
                    emailController.text, passController.text, context)) {
                  print('Login Success');
                  await PostFetchService().fetchPosts(context);
                  Navigator.pushNamed(context, '/posts');
                } else {
                  print('Login Failed');
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Login Failed'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text(
                                  'You have entered invalid email or password.'),
                              Text(
                                  'Please enter email and password correctly!'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
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
