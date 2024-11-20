import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/services/notification/notification_service.dart';
import '../../states/app_settings_state.dart';
import '../widgets/app_locale_drop_down.dart';
import '../widgets/app_setting_list_tile.dart';
import '../widgets/app_setting_switch.dart';
import '../widgets/app_theme_color_list_tile.dart';
import '../widgets/theme_mode_drop_down.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.settings),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSettingListTile(
                  title: appLocale.remindMorning,
                  subTitle: DateFormat('HH:mm').format(settingsState.getMorningNotificationTime),
                  leading: IconButton(
                    onPressed: () async {
                      final notificationTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: settingsState.getMorningNotificationTime.hour, minute: settingsState.getMorningNotificationTime.minute),
                      );
                      if (notificationTime != null) {
                        settingsState.setMorningNotificationTime = DateTime(2024, 12, 31, notificationTime.hour, notificationTime.minute);
                        if (settingsState.getMorningNotification) {
                          _notificationService.timeNotifications(id: NotificationService.morningNotificationID, title: appLocale.appName, body: appLocale.morningPrayers, dateTime: settingsState.getMorningNotificationTime);
                        }
                      }
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      size: 30,
                    ),
                  ),
                  trailing: IconButton.filledTonal(
                    onPressed: () {
                      settingsState.setMorningNotification = !settingsState.getMorningNotification;
                      if (settingsState.getMorningNotification) {
                        _notificationService.timeNotifications(id: NotificationService.morningNotificationID, title: appLocale.appName, body: appLocale.morningPrayers, dateTime: settingsState.getMorningNotificationTime);
                      } else {
                        _notificationService.cancelNotificationWithId(NotificationService.morningNotificationID);
                      }
                    },
                    icon: Icon(
                      settingsState.getMorningNotification ? Icons.notifications_on_outlined : Icons.notifications_off_outlined,
                      color: settingsState.getMorningNotification ? appColors.primary : appColors.onSurface,
                      size: 30,
                    ),
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: appLocale.remindEvening,
                  subTitle: DateFormat('HH:mm').format(settingsState.getEveningNotificationTime),
                  leading: IconButton(
                    onPressed: () async {
                      final notificationTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: settingsState.getEveningNotificationTime.hour, minute: settingsState.getEveningNotificationTime.minute),
                      );
                      if (notificationTime != null) {
                        settingsState.setEveningNotificationTime = DateTime(2024, 12, 31, notificationTime.hour, notificationTime.minute);
                        if (settingsState.getEveningNotification) {
                          _notificationService.timeNotifications(id: NotificationService.eveningNotificationID, title: appLocale.appName, body: appLocale.eveningPrayers, dateTime: settingsState.getEveningNotificationTime);
                        }
                      }
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      size: 30,
                    ),
                  ),
                  trailing: IconButton.filledTonal(
                    onPressed: () {
                      settingsState.setEveningNotification = !settingsState.getEveningNotification;
                      if (settingsState.getEveningNotification) {
                        _notificationService.timeNotifications(id: NotificationService.eveningNotificationID, title: appLocale.appName, body: appLocale.eveningPrayers, dateTime: settingsState.getEveningNotificationTime);
                      } else {
                        _notificationService.cancelNotificationWithId(NotificationService.eveningNotificationID);
                      }
                    },
                    icon: Icon(
                      settingsState.getEveningNotification ? Icons.notifications_on_outlined : Icons.notifications_off_outlined,
                      color: settingsState.getEveningNotification ? appColors.primary : appColors.onSurface,
                      size: 30,
                    ),
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: appLocale.listChapters,
                  subTitle: appLocale.openWithListChapters,
                  leading: Icon(Icons.list_alt_rounded),
                  trailing: AppSettingSwitch(
                    value: settingsState.getOpenWithChapters,
                    onChanged: (onChanged) => settingsState.setOpenWithChapters = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: appLocale.display,
                  subTitle: appLocale.displayAlwaysOn,
                  leading: Icon(Icons.light_mode_outlined),
                  trailing: AppSettingSwitch(
                    value: settingsState.getDisplayAlwaysOn,
                    onChanged: (onChanged) => settingsState.setDisplayAlwaysOn = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppThemeColorListTile(),
                const Divider(indent: 16, endIndent: 16),
                ThemeModeDropDown(),
                const Divider(indent: 16, endIndent: 16),
                AppLocaleDropDown(),
                const Divider(indent: 16, endIndent: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
