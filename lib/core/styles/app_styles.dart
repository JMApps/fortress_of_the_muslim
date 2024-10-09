import 'package:flutter/material.dart';

class AppStyles {
  static const padding = EdgeInsets.all(16);
  static const paddingMini = EdgeInsets.all(8);
  static const paddingMicro = EdgeInsets.all(4);

  static const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const paddingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const paddingVertical = EdgeInsets.symmetric(horizontal: 16);
  static const paddingVerticalMini = EdgeInsets.symmetric(horizontal: 8);

  static const paddingVerHorMini = EdgeInsets.symmetric(vertical: 16, horizontal: 8);
  static const paddingHorVerMini = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const paddingHorVerMicro = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const paddingHorMiniVerMicro = EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  static const paddingTop = EdgeInsets.only(top: 16);
  static const paddingTopMini = EdgeInsets.only(top: 8);

  static const paddingRight = EdgeInsets.only(right: 16);
  static const paddingRightMini = EdgeInsets.only(right: 8);

  static const paddingBottom = EdgeInsets.only(bottom: 16);
  static const paddingBottom75 = EdgeInsets.only(bottom: 75);
  static const paddingBottomMini = EdgeInsets.only(bottom: 8);

  static const paddingLeft = EdgeInsets.only(left: 16);
  static const paddingLeftMini = EdgeInsets.only(left: 8);

  static const paddingWithoutTop = EdgeInsets.only(left: 16, right: 16, bottom: 16);
  static const paddingWithoutTopMini = EdgeInsets.only(left: 8, right: 8, bottom: 8);

  static const paddingWithoutBottom = EdgeInsets.only(left: 16, right: 16, top: 16);
  static const paddingWithoutBottomMini = EdgeInsets.only(left: 8, right: 8, top: 8);

  static const border = BorderRadius.all(Radius.circular(16));
  static const borderMini = BorderRadius.all(Radius.circular(8));
  static const borderWithBottom =  BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32));
  static const borderWithoutBottom =  BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16));

  static const borderTopLeft = BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),);
  static const borderTopRight = BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(16), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),);
  static const borderBottomLeft = BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(8),);
  static const borderBottomRight = BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(16),);

  static const shape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));
  static const shapeMini = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)));
}