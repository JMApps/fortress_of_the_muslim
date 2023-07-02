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
          child: Consumer<MainAppSettingsState>(
            builder: (context, settings, _) {
              return Column(
                children: [
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: Text(
                      'Список глав',
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'Открывать приложение со списка глав',
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: settings.getIsRunMainChapters,
                    onChanged: (bool? value) {
                      settings.runManinChapters();
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      'Экран',
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'Оставить экран включёным',
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: settings.getIsDisplayOn,
                    onChanged: (bool? value) {
                      settings.displayOnOff();
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      'Уведомления утром',
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'Напоминать про азкары утром',
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: settings.getIsMorningNotification,
                    onChanged: (bool? value) {
                      settings.morningNotification();
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      'Уведомления вечером',
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'Напоминать про азкары вечером',
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: settings.getIsEveningNotification,
                    onChanged: (bool? value) {
                      settings.eveningNotification();
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      'Адаптивная тема',
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'В соответствии с темой на устройстве',
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: settings.getIsAdaptiveTheme,
                    onChanged: (bool? value) {
                      settings.adaptiveTheme();
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      'Пользовательская тема',
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'Выбранная вами тема',
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: settings.getIsUserTheme,
                    onChanged: (bool? value) {
                      settings.userTheme();
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
