import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_app_settings_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:provider/provider.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainAppSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.settings),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              SwitchListTile(
                title: Text(
                  'Список глав',
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'Открывать приложение со списка глав',
                  style: theme.textTheme.labelMedium,
                ),
                visualDensity: const VisualDensity(horizontal: -4),
                value: true,
                onChanged: (bool? value) {},
              ),
              const Divider(),
              SwitchListTile(
                title: Text(
                  'Экран',
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'Оставить экран включёным',
                  style: theme.textTheme.labelMedium,
                ),
                visualDensity: const VisualDensity(horizontal: -4),
                value: true,
                onChanged: (bool? value) {},
              ),
              const Divider(),
              SwitchListTile(
                title: Text(
                  'Адаптивная тема',
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'В соответствии с темой на устройстве',
                  style: theme.textTheme.labelMedium,
                ),
                visualDensity: const VisualDensity(horizontal: -4),
                value: true,
                onChanged: (bool? value) {},
              ),
              const Divider(),
              SwitchListTile(
                title: Text(
                  'Пользовательская тема',
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'Выбранная вами тема',
                  style: theme.textTheme.labelMedium,
                ),
                visualDensity: const VisualDensity(horizontal: -4),
                value: true,
                onChanged: (bool? value) {},
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
