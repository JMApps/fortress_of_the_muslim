import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/main_app.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(Constants.keyMainSettingBox);
  runApp(const MainApp());
}
