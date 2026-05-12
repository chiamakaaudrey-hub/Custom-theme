import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    //constraints: BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.black),
    hintStyle: TextStyle().copyWith(fontSize: TSizes.fontSizeSm, color: TColors.black),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(color: TColors.black.withOpacity(0.8)),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.grey),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.grey),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.dark),
  ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.warning),
),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 2, color: TColors.warning),
),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    //constraints: BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.white),
    hintStyle: TextStyle().copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
    floatingLabelStyle: TextStyle().copyWith(color: TColors.white.withOpacity(0.8)),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.darkGrey),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.darkGrey),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.light),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: BorderSide(width: 2, color: TColors.warning),
    ),
  );

}



























