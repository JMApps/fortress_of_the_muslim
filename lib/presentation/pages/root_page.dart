import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/states/app_settings_state.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/themes/app_themes.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsState>(
      builder: (context, appSettings, _) {
        final appThemes = AppThemes(Color(appSettings.getAppThemeColor));
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onRouteGenerator,
          theme: appThemes.lightTheme,
          darkTheme: appThemes.darkTheme,
          themeMode: appSettings.getThemeMode,
          home: const MainPage(),
        );
      },
    );
  }
}
