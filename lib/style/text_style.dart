import 'package:flutter/material.dart';

enum CustomTextStyle {
  heading,
  subHeading,
  whiteHeading,
  mediumHeading,
  boldSubHeading,
}

extension CustomTextStyleExtension on CustomTextStyle {
  TextStyle get style {
    switch (this) {
      case CustomTextStyle.whiteHeading:
        return const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );

      case CustomTextStyle.subHeading:
        return const TextStyle(fontSize: 14);

      case CustomTextStyle.boldSubHeading:
        return const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

      case CustomTextStyle.heading:
        return const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

      case CustomTextStyle.mediumHeading:
        return const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    }
  }
}
