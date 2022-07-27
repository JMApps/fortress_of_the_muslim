import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/app_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/settings_app_bar.dart';
import 'package:provider/provider.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<AppSettingsState>(
      builder: (BuildContext context, appSettings, Widget? child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.maxFinite, 50),
            child: SettingsAppBar(),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            children: [
              SwitchListTile.adaptive(
                activeColor: myColor.mainSettingsColor,
                title: const Text(
                  'Список глав',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Открывать приложение со списка глав',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                value: appSettings.isRunChapters,
                onChanged: (value) {
                  appSettings.changeRunWithChapters(value);
                },
              ),
              const Divider(indent: 16, endIndent: 16),
              SwitchListTile.adaptive(
                activeColor: myColor.mainSettingsColor,
                title: const Text(
                  'Последняя глава',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Запоминать последнюю читаемую главу',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                value: appSettings.isLastChapter,
                onChanged: (value) {
                  appSettings.changeShowLastChapter(value);
                },
              ),
              // const Divider(indent: 16, endIndent: 16),
              // SwitchListTile.adaptive(
              //   activeColor: myColor.mainSettingsColor,
              //   title: const Text(
              //     'Уведомления',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   subtitle: const Text(
              //     'Ежедневные уведомления утром и вечером',
              //     style: TextStyle(
              //       fontSize: 16,
              //     ),
              //   ),
              //   value: appSettings.isNotification,
              //   onChanged: (value) {
              //     appSettings.changeShowNotification(value);
              //   },
              // ),
              const Divider(indent: 16, endIndent: 16),
              SwitchListTile.adaptive(
                activeColor: myColor.mainSettingsColor,
                title: const Text(
                  'Экран',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Оставить экран включенным пока приложение активно',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                value: appSettings.getIsWakeLock,
                onChanged: (value) {
                  appSettings.changeWakeLock(value);
                },
              ),
              const Divider(indent: 16, endIndent: 16),
              SwitchListTile.adaptive(
                activeColor: myColor.mainSettingsColor,
                title: const Text(
                  'Адаптивная тема',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Будет использована адаптивная тема',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                value: appSettings.isAdaptiveTheme,
                onChanged: (value) {
                  appSettings.changeAdaptiveTheme(value);
                },
              ),
              SwitchListTile.adaptive(
                activeColor: myColor.mainSettingsColor,
                title: const Text(
                  'Тема',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Используйте светлую и ночную темы',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                value: appSettings.isDarkTheme,
                onChanged: appSettings.isAdaptiveTheme ? null : (value) {
                  appSettings.changeTheme(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
