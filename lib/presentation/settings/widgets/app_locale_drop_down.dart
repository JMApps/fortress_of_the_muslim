import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/app_settings_state.dart';

class AppLocaleDropDown extends StatelessWidget {
  const AppLocaleDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontRaleway, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<AppSettingsState>(
      builder: (BuildContext context, appSettings, _) {
        return ListTile(
          visualDensity: VisualDensity.comfortable,
          title: Text(
            appLocale.language,
            style: AppStyles.mainTextStyle17Bold,
          ),
          subtitle: Text(appLocale.appLanguage),
          leading: const Icon(Icons.language_rounded),
          trailing: DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            borderRadius: AppStyles.border,
            padding: AppStyles.paddingHorizontalMini,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: appSettings.getAppLocaleIndex,
            items: List.generate(
              AppConstraints.appLanguages.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      AppConstraints.appLanguages[index],
                      style: appSettings.getAppLocaleIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle17,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: (newIndex) {
              appSettings.setAppLocaleIndex = newIndex!;
            },
            underline: const SizedBox(),
          ),
        );
      },
    );
  }
}
