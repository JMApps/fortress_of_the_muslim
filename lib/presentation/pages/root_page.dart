import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/routes/app_routes.dart';
import '../../core/strings/app_constraints.dart';
import '../../core/themes/app_themes.dart';
import '../states/app_settings_state.dart';
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
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: AppConstraints.appLocales[appSettings.getAppLocaleIndex],
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          theme: appThemes.lightTheme,
          darkTheme: appThemes.darkTheme,
          themeMode: appSettings.getThemeMode,
          home: const MainPage(),
        );
      },
    );
  }
}
