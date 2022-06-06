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
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: SettingsAppBar(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
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
            onChanged: (value) {},
            value: false,
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
            onChanged: (value) {},
            value: true,
          ),
          const Divider(indent: 16, endIndent: 16),
          SwitchListTile.adaptive(
            activeColor: myColor.mainSettingsColor,
            title: const Text(
              'Уведомления',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Ежедневные уведомления утром и вечером',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onChanged: (value) {},
            value: true,
          ),
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
            onChanged: (value) {},
            value: false,
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
              'Текущая тема (адаптивная)',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            value: context.watch<AppSettingsState>().isDarkMode,
            onChanged: (value) {
              context.read<AppSettingsState>().toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}
