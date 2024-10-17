import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/footnote_entity.dart';
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
      future: Provider.of<FootnotesState>(context).getFootnoteById(footnoteId: footnoteNumber),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            padding: AppStyles.paddingWithoutTop,
            child: MainHtmlData(
              htmlData: '${snapshot.data!.footnoteId}: ${snapshot.data!.footnote}',
              footnoteColor: footnoteColor,
              font: AppStrings.fontGilroy,
              fontSize: 18.0,
              textAlign: TextAlign.start,
              fontColor: Theme.of(context).colorScheme.onSurface,
            ),
          );
        } else if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
