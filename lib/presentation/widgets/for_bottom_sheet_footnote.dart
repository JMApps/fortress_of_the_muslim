import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';

class ForBottomSheetFootnote extends StatelessWidget {
  const ForBottomSheetFootnote({
    super.key,
    required this.footnoteData,
  });

  final String footnoteData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: AppStyles.mainPadding,
      child: Html(
        data: footnoteData,
        style: {
          '#': Style(
            padding: HtmlPaddings.zero,
            margin: Margins.zero,
            fontSize: FontSize(17),
            fontFamily: 'Gilroy',
            color: theme.colorScheme.mainDefaultColor,
            textAlign: TextAlign.center
          ),
          'b': Style(
            padding: HtmlPaddings.zero,
            margin: Margins.zero,
            fontSize: FontSize(17),
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
    );
  }
}
