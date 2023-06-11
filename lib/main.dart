import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:fortress_of_the_muslim/data/service/database_service.dart';
import 'package:fortress_of_the_muslim/main/root_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettings);
  await Hive.openBox(AppConstraints.keyCounter);
  DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDatabase();
  runApp(
    const RootPage(),
  );
}
