import 'package:flutter/material.dart';
import 'kyozo_colors.dart';

class KyozoTextStyles {
  static const String fontFamilyDisplay = 'Canicule Display';
  static const String fontFamilyBody = 'Inter';
  static const String fontFamilyDMSans = 'DM Sans';
  
  static const cardTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamilyBody,
    color: KyozoColors.textPrimary,
    height: 1.2,
  );
  
  static const cardBody = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyBody,
    color: KyozoColors.textSecondary,
    height: 1.5,
  );
  
  static const badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamilyBody,
    color: Colors.white,
  );
  
  static const inputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyBody,
    color: KyozoColors.textPrimary,
  );
  
  static const inputLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyBody,
    color: KyozoColors.textSecondary,
  );
  
  static const inputLabelFocused = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyBody,
    color: KyozoColors.inputBorderColor,
  );
  
  static const buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyBody,
    color: KyozoColors.primaryPurple,
  );
  
  static const buttonTextBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamilyBody,
  );
  
  static const heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilyDMSans,
    color: KyozoColors.headingColor,
  );
  
  static const heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyDMSans,
    color: KyozoColors.headingColor,
  );
}
