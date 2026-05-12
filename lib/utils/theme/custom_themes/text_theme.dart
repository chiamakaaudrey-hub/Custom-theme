import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.dark),
    headlineMedium: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.dark),
    headlineSmall: TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.dark),
    
    titleLarge: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.dark),
    titleMedium: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.dark),
    titleSmall: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.dark),
    
    bodyLarge: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.dark),
    bodyMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.dark),
    bodySmall: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.dark.withOpacity(0.5)),
    
    labelLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.dark),
    labelMedium: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.dark.withOpacity(0.5)),
  );
  
  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.light),
    headlineMedium: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.light),
    headlineSmall: TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.light),
    
    titleLarge: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.light),
    titleMedium: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.light),
    titleSmall: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.light),
    
    bodyLarge: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.light),
    bodyMedium: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.normal, color: TColors.light),
    bodySmall: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.light.withOpacity(0.5)),
    
    labelLarge: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.normal, color: TColors.light),
    labelMedium: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.normal, color: TColors.light.withOpacity(0.5)),
  );
}




























