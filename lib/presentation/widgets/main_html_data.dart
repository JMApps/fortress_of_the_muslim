import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/strings/app_strings.dart';
import 'main_footnote_data.dart';

class MainHtmlData extends StatelessWidget {
  const MainHtmlData({
    super.key,
    required this.htmlData,
    required this.footnoteColor,
    required this.fontSize,
  });

  final String htmlData;
  final Color footnoteColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(16),
        ),
        'a': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(fontSize),
          fontWeight: FontWeight.bold,
          color: footnoteColor,
          fontFamily: AppStrings.fontRoboto,
        ),
      },
      onLinkTap: (String? footnoteNumber, _, __) {
        showModalBottomSheet(
          context: (context),
          isScrollControlled: true,
          builder: (_) => MainFootnoteData(
            footnoteNumber: int.parse(footnoteNumber!),
            footnoteColor: footnoteColor,
          ),
        );
      },
    );
  }
}
