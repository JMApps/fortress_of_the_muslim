import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class ForBottomSheetFootnote extends StatelessWidget {
  const ForBottomSheetFootnote({
    super.key,
    required this.footnoteData,
    required this.footnoteColor,
  });

  final String footnoteData;
  final Color footnoteColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: AppStyles.mainPadding,
      child: FutureBuilder<List>(
        future: context
            .watch<MainChaptersState>()
            .getDatabaseQuery
            .getOneFootnotes(int.parse(footnoteData)),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: footnoteColor,
                      child: Text(
                        footnoteData,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Html(
                      data: snapshot.data![0].footnote,
                      style: {
                        '#': Style(
                          padding: HtmlPaddings.zero,
                          margin: Margins.zero,
                          fontSize: FontSize(18),
                          fontFamily: 'Gilroy',
                          color: theme.colorScheme.mainDefaultColor,
                          textAlign: TextAlign.center,
                        ),
                        'b': Style(
                          padding: HtmlPaddings.zero,
                          margin: Margins.zero,
                          fontSize: FontSize(18),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: theme.colorScheme.mainDefaultColor,
                        ),
                        'small': Style(
                          padding: HtmlPaddings.zero,
                          margin: Margins.zero,
                          fontSize: FontSize(12),
                          fontFamily: 'Gilroy',
                          color: Colors.grey,
                        ),
                      },
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    AppStrings.errorLoadData,
                    style: theme.textTheme.labelMedium,
                  ),
                );
        },
      ),
    );
  }
}
