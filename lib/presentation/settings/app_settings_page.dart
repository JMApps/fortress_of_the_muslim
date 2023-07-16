import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_app_settings_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: SingleChildScrollView(
        child: Consumer<MainAppSettingsState>(
          builder: (context, settings, _) {
            return Column(
              children: [
                const SizedBox(height: 8),
                ListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  title: Text(
                    'Уведомления утром',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Напоминать в ${DateFormat().add_Hm().format(DateTime.parse(settings.getDefaultMorningNotificationTime))}',
                    style: theme.textTheme.bodySmall,
                  ),
                  trailing: Switch(
                    activeColor: theme.colorScheme.mainChaptersColor,
                    value: settings.getIsMorningNotification,
                    onChanged: (bool? value) {
                      settings.morningNotification();
                    },
                  ),
                  leading: IconButton(
                    splashRadius: 25,
                    color: theme.colorScheme.mainChaptersColor,
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialEntryMode: TimePickerEntryMode.dialOnly,
                        initialTime: TimeOfDay.fromDateTime(DateTime.parse(settings.getDefaultMorningNotificationTime)),
                        helpText: AppStrings.morningNotification,
                        cancelText: AppStrings.cancel,
                        confirmText: AppStrings.confirm,
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          );
                        },
                      ).then((TimeOfDay? time) {
                        if (time != null) {
                          settings.changeMorningTimeOfDay(DateTime(2023, 12, 31, time.hour, time.minute).toIso8601String());
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.date_range,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  title: Text(
                    'Уведомления вечером',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Напоминать в ${DateFormat().add_Hm().format(DateTime.parse(settings.getDefaultEveningNotificationTime))}',
                    style: theme.textTheme.bodySmall,
                  ),
                  trailing: Switch(
                    activeColor: theme.colorScheme.mainChaptersColor,
                    value: settings.getIsEveningNotification,
                    onChanged: (bool? value) {
                      settings.eveningNotification();
                    },
                  ),
                  leading: IconButton(
                    splashRadius: 25,
                    color: theme.colorScheme.mainChaptersColor,
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialEntryMode: TimePickerEntryMode.dialOnly,
                        initialTime: TimeOfDay.fromDateTime(DateTime.parse(settings.getDefaultEveningNotificationTime)),
                        helpText: AppStrings.eveningNotification,
                        cancelText: AppStrings.cancel,
                        confirmText: AppStrings.confirm,
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          );
                        },
                      ).then((TimeOfDay? time) {
                        if (time != null) {
                          settings.changeEveningTimeOfDay(DateTime(2023, 12, 31, time.hour, time.minute).toIso8601String());
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.date_range,
                    ),
                  ),
                ),
                const Divider(),
                SwitchListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  title: Text(
                    'Список глав',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Открывать приложение со списка глав',
                    style: theme.textTheme.bodySmall,
                  ),
                  activeColor: theme.colorScheme.mainChaptersColor,
                  value: settings.getIsRunMainChapters,
                  onChanged: (bool? value) {
                    settings.runManinChapters();
                  },
                ),
                const Divider(),
                SwitchListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  title: Text(
                    'Экран',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Оставить экран включёным',
                    style: theme.textTheme.bodySmall,
                  ),
                  activeColor: theme.colorScheme.mainChaptersColor,
                  value: settings.getIsDisplayOn,
                  onChanged: (bool? value) {
                    settings.displayOnOff();
                  },
                ),
                const Divider(),
                SwitchListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  title: Text(
                    'Адаптивная тема',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'В соответствии с темой на устройстве',
                    style: theme.textTheme.bodySmall,
                  ),
                  activeColor: theme.colorScheme.mainChaptersColor,
                  value: settings.getIsAdaptiveTheme,
                  onChanged: (bool? value) {
                    settings.adaptiveTheme();
                  },
                ),
                const Divider(),
                SwitchListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  title: Text(
                    'Пользовательская тема',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    'Выбранная вами тема',
                    style: theme.textTheme.bodySmall,
                  ),
                  activeColor: theme.colorScheme.mainChaptersColor,
                  value: settings.getIsUserTheme,
                  onChanged: settings.getIsAdaptiveTheme
                      ? null : (bool? value) {
                            settings.userTheme();
                          },
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}
