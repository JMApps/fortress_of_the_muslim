import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/notification/local_notice_service.dart';
import 'package:fortress_of_the_muslim/application/other/default_scroll_behavior.dart';
import 'package:fortress_of_the_muslim/application/route/app_routes.dart';
import 'package:fortress_of_the_muslim/application/state/main_app_settings_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/main/main_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainAppSettingsState settings = context.watch<MainAppSettingsState>();
    if (settings.getIsMorningNotification) {
      LocalNoticeService().morningZonedScheduleNotification(
        DateTime.parse(settings.getDefaultMorningNotificationTime),
        AppStrings.appName,
        AppStrings.morningNotificationTime,
        LocalNoticeService.morningNotificationID,
      );
    } else {
      LocalNoticeService().cancelNotificationWithId(LocalNoticeService.morningNotificationID);
    }
    if (settings.getIsEveningNotification) {
      LocalNoticeService().eveningZonedScheduleNotification(
        DateTime.parse(settings.getDefaultEveningNotificationTime),
        AppStrings.appName,
        AppStrings.eveningNotificationTime,
        LocalNoticeService.eveningNotificationID,
      );
    } else {
      LocalNoticeService().cancelNotificationWithId(LocalNoticeService.eveningNotificationID);
    }
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: DefaultScrollBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: AppRoutes.onGeneratorRoute,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: settings.getIsAdaptiveTheme
          ? ThemeMode.system
          : settings.getIsUserTheme
              ? ThemeMode.dark
              : ThemeMode.light,
      home: const MainPage(),
    );
  }
}
