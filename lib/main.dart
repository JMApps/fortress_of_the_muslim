import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/application/notification/local_notice_service.dart';
import 'package:fortress_of_the_muslim/application/state/main_app_settings_state.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:fortress_of_the_muslim/data/service/database_service.dart';
import 'package:fortress_of_the_muslim/main/root_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    LocalNoticeService().setupNotification();
    return Future.value(true);
  });
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettings);
  await Hive.openBox(AppConstraints.keyCounter);
  DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDatabase();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerPeriodicTask(
    'notificationTask',
    'notificationTask',
    frequency: const Duration(minutes: 15),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainAppSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
