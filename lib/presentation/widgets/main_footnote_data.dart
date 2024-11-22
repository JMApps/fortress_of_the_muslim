import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/footnote_entity.dart';
import '../states/app_settings_state.dart';
import '../states/footnotes_state.dart';
import 'main_error_text_data.dart';
import 'main_html_data.dart';

class MainFootnoteData extends StatelessWidget {
  const MainFootnoteData({
    super.key,
    required this.footnoteNumber,
    required this.footnoteColor,
  });

  final int footnoteNumber;
  final Color footnoteColor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FootnoteEntity>(
      future: Provider.of<FootnotesState>(context, listen: false).getFootnoteById(languageCode: AppConstraints.appLocales[Provider.of<AppSettingsState>(context, listen: false).getAppLocaleIndex].languageCode, footnoteId: footnoteNumber),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasError) {
            return MainErrorTextData(errorText: snapshot.error.toString());
          }
          return SingleChildScrollView(
            padding: AppStyles.paddingWithoutTop,
            child: MainHtmlData(
              htmlData: '<b>[${snapshot.data!.footnoteId}]</b> – ${snapshot.data!.footnote}',
              footnoteColor: footnoteColor,
              font: AppConstraints.fontRaleway,
              fontSize: 18.0,
              textAlign: TextAlign.center,
              fontColor: Theme.of(context).colorScheme.onSurface,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
