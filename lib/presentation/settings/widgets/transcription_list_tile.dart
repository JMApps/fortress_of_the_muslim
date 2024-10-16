import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/content_settings_state.dart';

class TranscriptionListTile extends StatelessWidget {
  const TranscriptionListTile({super.key});

  @override
  Widget build(BuildContext context) {
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
                AppStrings.transcription,
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
                AppStrings.showTranscription,
                style: AppStyles.mainTextStyle17,
              ),
              trailing: Switch.adaptive(
                activeColor: appColors.primary,
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
