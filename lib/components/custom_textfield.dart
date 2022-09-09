import 'package:flutter/material.dart';
import 'package:ms_global_task1/constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.hintTextColor,
    this.suffixIcon,
    this.keyboard,
    this.passwordField,
    this.customFontSize,
    this.customColor,
    this.textDeco,
  }) : super(key: key);

  final String hintText;
  final Color hintTextColor;
  final Widget? suffixIcon;
  final TextInputType? keyboard;
  final bool? passwordField;
  final double? customFontSize;
  final Color? customColor;
  final TextDecoration? textDeco;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 50,
      child: TextField(
        obscureText: passwordField ?? false,
        keyboardType: keyboard,
        style: const TextStyle(color: kDefaultButtonColor),
        decoration: InputDecoration(
          border: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none)
              .copyWith(borderRadius: BorderRadius.circular(8)),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: customColor ?? const Color.fromRGBO(230, 230, 230, 1),
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: customFontSize ?? 15,
            decoration: textDeco ?? TextDecoration.none,

            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
