import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/supplication_day_night_item.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';
import 'package:fortress_of_the_muslim/widget/take_day_night_screenshot.dart';
import 'package:fortress_of_the_muslim/widget/take_screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class TakeScreenshotState with ChangeNotifier {

  final _screenshotController = ScreenshotController();

  ScreenshotController get getScreenshotController => ScreenshotController();

  takeScreenshot(SupplicationModelItem item, int index, int supplicationLength, String chapterTitle) async {
    final unit8List = await _screenshotController.captureFromWidget(TakeScreenShot(item: item, index: index, supplicationLength: supplicationLength, chapterTitle: chapterTitle));
    String tempPath = (Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory())!.path;
    File file = File('$tempPath/dua_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path], sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
    );
  }

  takeDayNightScreenshot(SupplicationDayNightItem item, int index, int supplicationLength) async {
    final unit8List = await _screenshotController.captureFromWidget(TakeDayNightScreenShot(item: item, index: index, supplicationLength: supplicationLength));
    String tempPath = (Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory())!.path;
    File file = File('$tempPath/dua_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path], sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
    );
  }
}