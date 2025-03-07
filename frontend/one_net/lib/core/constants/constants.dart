import 'package:flutter/material.dart';
import 'package:one_net/core/utils/responsive.dart';

// Color constants
const primaryColor = Color(0xFF153AFE);
const defaultBackgroundColor = Colors.white;
const defaultTextColor = Colors.black;
const hintColor = Color(0xFF98A2B3);
const lightGray = Color(0xFFF2F4F7);
const errorColor = Colors.red;

// TextStyle Constants
TextStyle bodySmall(BuildContext context) => TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: Responsive.responsiveFontSize(context, 12),
      fontWeight: FontWeight.w500,
      height: 14.32 / 12,
    );

TextStyle hintText(BuildContext context) => TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: Responsive.responsiveFontSize(context, 12),
      fontWeight: FontWeight.w400,
      height: 14.32 / 12,
    );

TextStyle buttonText(BuildContext context) => TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: Responsive.responsiveFontSize(context, 14),
      fontWeight: FontWeight.w600,
      height: 14.32 / 12,
    );
