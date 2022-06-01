import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/settings_app_bar.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: SettingsAppBar(),
      ),
      body: Container(),
    );
  }
}
