import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_bottom_sheet_footnote.dart';

class ForHtmlText extends StatelessWidget {
  const ForHtmlText({
    super.key,
    required this.textData,
    required this.textSize,
    required this.textColor,
    required this.fontFamily,
    required this.footnoteColor,
    required this.textDataAlign,
  });

  final String textData;
  final double textSize;
  final Color textColor;
  final String fontFamily;
  final Color footnoteColor;
  final TextAlign textDataAlign;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: textData,
      style: {
        '#': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(textSize),
          fontFamily: fontFamily,
          color: textColor,
          textAlign: textDataAlign,
        ),
        'b': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(textSize),
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          color: textColor,
        ),
        'small': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(textSize - 5),
          fontFamily: fontFamily,
          color: Colors.grey,
        ),
        'a': Style(
          fontSize: FontSize(textSize - 5),
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: footnoteColor,
        ),
        'i': Style(
          fontSize: FontSize(textSize),
          fontWeight: FontWeight.w100,
          fontFamily: fontFamily,
          color: textColor,
        ),
      },
      onLinkTap: (String? url, _, __) {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => Card(
            margin: AppStyles.mainMargin,
            child: ForBottomSheetFootnote(
              footnoteData: url!,
              footnoteColor: footnoteColor,
            ),
          ),
        );
      },
    );
  }
}
