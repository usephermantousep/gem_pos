import 'package:flutter/material.dart';

import 'color.dart';

class TextStyleCustom {
  final TextStyle mainTextStyle;
  const TextStyleCustom({required this.mainTextStyle});

  TextStyle get titleLargeStyle => mainTextStyle.copyWith(
        color: AppColor.txColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );

  TextStyle get titleMediumStyle => mainTextStyle.copyWith(
        color: AppColor.txColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );

  TextStyle get titleSmallStyle => mainTextStyle.copyWith(
        color: AppColor.txColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );

  TextStyle get bodyLargeStyle => mainTextStyle.copyWith(
        color: AppColor.txColor,
        fontSize: 20,
      );

  TextStyle get bodyMediumStyle => mainTextStyle.copyWith(
        color: AppColor.txColor,
        fontSize: 16,
      );

  TextStyle get bodySmallStyle => mainTextStyle.copyWith(
        color: AppColor.txColor,
        fontSize: 14,
      );
}
