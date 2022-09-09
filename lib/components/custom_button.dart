import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final void Function()? buttonFunction;
  final double desiredWidth;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonFunction,
    required this.desiredWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: desiredWidth,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          shadowColor: MaterialStateProperty.all(buttonColor),
          fixedSize: MaterialStateProperty.all(
            Size(desiredWidth, 40),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
