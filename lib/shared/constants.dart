import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(217, 35, 68, 1);
const Color kSecondaryColor = Color.fromRGBO(36, 35, 35, 1);
const Color kAccentColor = Color.fromRGBO(20, 166, 151, 1);
//const Color accentColor = Color.fromRGBO(45, 207, 205, 1);
const Color textBoxFontColor = Color.fromRGBO(150, 150, 150, 1);
const Color facebookButtonColor = Color.fromRGBO(59, 89, 152, 1);
//const Color facebookButtonColor = Color.fromRGBO(21, 126, 251, 1);

InputDecoration textInputDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: kPrimaryColor, style: BorderStyle.solid)),
  disabledBorder: InputBorder.none,
  contentPadding:
  EdgeInsets.only(left: 15, bottom: 11, top: 5, right: 15),
);

BoxDecoration signInPageContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
);
