import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../states/app_settings_state.dart';
import 'app_setting_list_tile.dart';

class AppThemeColorListTile extends StatelessWidget {
  const AppThemeColorListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<AppSettingsState>(
      builder: (context, settingsState, _) {
        return AppSettingListTile(
          title: appLocale.themeColor,
          subTitle: appLocale.selectThemeColor,
          leading: const Icon(Icons.color_lens_outlined),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  actionsPadding: AppStyles.paddingMini,
                  title: Text(
                    appLocale.themeColor,
                    style: AppStyles.mainTextStyle17Bold,
                  ),
                  content: Material(
                    color: Colors.transparent,
                    child: MaterialColorPicker(
                      alignment: WrapAlignment.center,
                      iconSelected: Icons.check_circle,
                      elevation: 0.5,
                      allowShades: false,
                      onMainColorChange: (Color? color) => settingsState.setAppThemeColor = color!.value,
                      selectedColor: Color(settingsState.getAppThemeColor),
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        appLocale.close,
                        style: AppStyles.mainTextStyle17,
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.circle,
              color: Color(settingsState.getAppThemeColor),
              size: 35,
            ),
          ),
        );
      },
    );
  }
}
