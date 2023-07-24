import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/application/notification/local_notice_service.dart';
import 'package:fortress_of_the_muslim/application/state/content_settings_state.dart';
import 'package:fortress_of_the_muslim/application/state/main_app_settings_state.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:fortress_of_the_muslim/data/service/database_service.dart';
import 'package:fortress_of_the_muslim/main/root_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettings);
  await Hive.openBox(AppConstraints.keyCounter);
  await Hive.openBox(AppConstraints.keyContentSettings);
  await DatabaseService().initializeDatabase();
  await LocalNoticeService().setupNotification();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainAppSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
