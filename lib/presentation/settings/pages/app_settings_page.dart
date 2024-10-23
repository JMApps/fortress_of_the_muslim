import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../states/app_settings_state.dart';
import '../widgets/app_setting_list_tile.dart';
import '../widgets/app_setting_switch.dart';
import '../widgets/app_theme_color_list_tile.dart';
import '../widgets/theme_mode_drop_down.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSettingListTile(
                  title: AppStrings.remindMorning,
                  subTitle: DateFormat('HH:mm').format(settingsState.getMorningNotificationTime),
                  leading: IconButton.filledTonal(
                    onPressed: settingsState.getMorningNotification ? () async {
                      final notificationTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: settingsState.getMorningNotificationTime.hour, minute: settingsState.getMorningNotificationTime.minute),
                      );
                      if (notificationTime != null) {
                        settingsState.setMorningNotificationTime = DateTime(2024, 12, 31, notificationTime.hour, notificationTime.minute);
                      }
                    } : null,
                    icon: Icon(
                      Icons.notifications_on_outlined,
                      color: settingsState.getMorningNotification ? appColors.primary : appColors.onSurface,
                    ),
                  ),
                  trailing: AppSettingSwitch(
                    value: settingsState.getMorningNotification,
                    onChanged: (onChanged) => settingsState.setMorningNotification = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: AppStrings.remindEvening,
                  subTitle: DateFormat('HH:mm').format(settingsState.getEveningNotificationTime),
                  leading: IconButton.filledTonal(
                    onPressed: settingsState.getEveningNotification ? () async {
                      final notificationTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: settingsState.getEveningNotificationTime.hour, minute: settingsState.getEveningNotificationTime.minute),
                      );
                      if (notificationTime != null) {
                        settingsState.setEveningNotificationTime = DateTime(2024, 12, 31, notificationTime.hour, notificationTime.minute);
                      }
                    } : null,
                    icon: Icon(
                      Icons.notifications_on_outlined,
                      color: settingsState.getEveningNotification ? appColors.primary : appColors.onSurface,
                    ),
                  ),
                  trailing: AppSettingSwitch(
                    value: settingsState.getEveningNotification,
                    onChanged: (onChanged) => settingsState.setEveningNotification = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: AppStrings.listChapters,
                  subTitle: AppStrings.openWithListChapters,
                  leading: Icon(Icons.list_alt_rounded),
                  trailing: AppSettingSwitch(
                    value: settingsState.getOpenWithChapters,
                    onChanged: (onChanged) => settingsState.setOpenWithChapters = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: AppStrings.display,
                  subTitle: AppStrings.displayAlwaysOn,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
