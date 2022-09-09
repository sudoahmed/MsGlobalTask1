import 'package:flutter/material.dart';

const Color kDefaultButtonColor = Color.fromRGBO(228, 50, 40, 1);

const MaterialColor kPrimaryColor = MaterialColor(
  0xffE43228, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xff068789), //10%
    100: Color(0xff068789), //20%
    200: Color(0xff068789), //30%
    300: Color(0xff068789), //40%
    400: Color(0xff068789), //50%
    500: Color(0xff068789), //60%
    600: Color(0xff068789), //70%
    700: Color(0xff068789), //80%
    800: Color(0xff068789), //90%
    900: Color(0xff068789), //100%
  },
);
