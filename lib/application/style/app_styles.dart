import 'package:flutter/material.dart';

class AppStyles {
  static const appBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.elliptical(35, 25),
      bottomRight: Radius.elliptical(35, 25),
    ),
  );

  static const onlyBorderList = <BorderRadius>[
    BorderRadius.only(
      topLeft: Radius.elliptical(35, 35),
    ),
    BorderRadius.only(
      topRight: Radius.elliptical(35, 35),
    ),
    BorderRadius.only(
      bottomLeft: Radius.elliptical(35, 35),
    ),
    BorderRadius.only(
      bottomRight: Radius.elliptical(35, 35),
    ),
  ];

  static const mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );

  static const mainBorder = BorderRadius.all(
    Radius.circular(25),
  );

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);
}
