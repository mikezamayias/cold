import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Package styles
class PackageStyles {
  static Text getTextTitle(String title) => new Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );

  static Text getTextSubTitle(String subTitle) => new Text(
        subTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  static Text getTextHeader(String header) => new Text(
        header,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      );
}
