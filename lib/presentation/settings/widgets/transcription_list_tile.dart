import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/content_settings_state.dart';

class TranscriptionListTile extends StatelessWidget {
  const TranscriptionListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                appLocale.transcription,
                style: AppStyles.mainTextStyle17Bold,
              ),
              leading: Icon(
                Icons.format_size,
                color: appColors.primary,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                appLocale.showTranscription,
                style: AppStyles.mainTextStyle17,
              ),
              trailing: Switch.adaptive(
                activeColor: appColors.inversePrimary,
                value: contentSettings.getShowTranscriptionState,
                onChanged: (bool onChanged) {
                  contentSettings.setShowTranscriptionState = onChanged;
                },
              ),
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
