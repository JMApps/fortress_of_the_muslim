import 'package:flutter/material.dart';


class AppStyles {
  static const padding = EdgeInsets.all(16);
  static const paddingMini = EdgeInsets.all(8);
  static const paddingMicro = EdgeInsets.all(4);

  static const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const paddingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const paddingHorVerMicro = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const paddingHorMiniVerMicro = EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  static const paddingTopMini = EdgeInsets.only(top: 8);

  static const paddingRightMini = EdgeInsets.only(right: 8);

  static const paddingBottom = EdgeInsets.only(bottom: 16);
  static const paddingBottom75 = EdgeInsets.only(bottom: 75);
  static const paddingBottomMini = EdgeInsets.only(bottom: 8);

  static const paddingWithoutTop = EdgeInsets.only(left: 16, right: 16, bottom: 16);
  static const paddingWithoutTopMini = EdgeInsets.only(left: 8, right: 8, bottom: 8);

  static const paddingWithoutBottom = EdgeInsets.only(left: 16, right: 16, top: 16);
  static const paddingWithoutTopBottom = EdgeInsets.only(left: 8, right: 8, bottom: 16);

  static const border = BorderRadius.all(Radius.circular(16));
  static const borderBig = BorderRadius.all(Radius.circular(25));
  static const borderMini = BorderRadius.all(Radius.circular(8));
  static const borderBottomLeft = BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(8),);
  static const borderBottomRight = BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(25),);

  static const mainTextStyle17 = TextStyle(fontSize: 17.0);
  static const mainTextStyle17Bold = TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold);

  static const shape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  static const textAlignIcons = <Icon>[
    Icon(Icons.format_align_left_rounded),
    Icon(Icons.format_align_center_rounded),
    Icon(Icons.format_align_right_rounded),
    Icon(Icons.format_align_justify_rounded),
  ];

  static const arabicTextAlignIcons = <Icon>[
    Icon(Icons.format_align_right_rounded),
    Icon(Icons.format_align_center_rounded),
    Icon(Icons.format_align_left_rounded),
    Icon(Icons.format_align_justify_rounded),
  ];

  static const textSizes = <double>[
    16.0,
    18.0,
    20.0,
    25.0,
    40.0,
    65.0,
  ];

  static const playSpeeds = <double>[
    1.0,
    0.9,
    0.8,
    0.7,
    0.6,
    0.5,
  ];

  static const textAligns = <TextAlign>[
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
    TextAlign.justify,
  ];

  static const counterAlign = <MainAxisAlignment>[
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
  ];
}