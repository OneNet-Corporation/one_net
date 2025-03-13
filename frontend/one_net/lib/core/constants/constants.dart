import 'package:flutter/material.dart';
import 'package:one_net/core/utils/responsive.dart';

// Color constants
const primaryColor = Color(0xFF153AFE);
const defaultBackgroundColor = Colors.white;
const defaultTextColor = Colors.black;
const hintColor = Color(0xFF98A2B3);
const lightGray = Color(0xFFF2F4F7);
const darkGray = Color(0xFF344054);
const tagColor = Color(0xFF667085);
const contentColor = Color(0xFF101828);
const activeColor = Color(0xFF6FCF97);
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

TextStyle profileStat(BuildContext context) => TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: Responsive.responsiveFontSize(context, 13),
      fontWeight: FontWeight.w700,
      height: 14.32 / 12,
    );
