import 'package:flutter/material.dart';

enum CustomTextStyle {
  heading,
  subHeading,
  mediumHeading,
  boldSubHeading,
  graySubHeading,
}

extension CustomTextStyleExtension on CustomTextStyle {
  TextStyle get style {
    switch (this) {
      case CustomTextStyle.graySubHeading:
        return const TextStyle(
          fontSize: 14,
          color: Colors.grey,
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
