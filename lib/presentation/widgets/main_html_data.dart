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
    required this.textAlign,
  });

  final String htmlData;
  final Color footnoteColor;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(fontSize),
          textAlign: textAlign,
        ),
        'small': Style(
          fontSize: FontSize(14.0)
        ),
        'a': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(fontSize - 3),
          letterSpacing: 1.5,
          color: footnoteColor,
          fontWeight: FontWeight.bold,
          fontFamily: AppStrings.fontMontserrat,
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
