import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../supplications/widgets/favorite_supplication_button.dart';
import '../supplications/widgets/share_supplication_button.dart';

class SupplicationMediaCard extends StatefulWidget {
  const SupplicationMediaCard({
    super.key,
    required this.supplicationModel,
  });

  final SupplicationEntity supplicationModel;

  @override
  State<SupplicationMediaCard> createState() => _SupplicationMediaCardState();
}

class _SupplicationMediaCardState extends State<SupplicationMediaCard> {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: AppStyles.shape,
      color: appColors.onSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // Play audio
            },
            icon: const Icon(Icons.play_circle_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              // Save repeat state
            },
            icon: const Icon(Icons.repeat),
          ),
          IconButton(
            onPressed: () {
              // Save speed index
            },
            icon: const Icon(Icons.speed_rounded),
          ),
          FavoriteSupplicationButton(supplicationId: widget.supplicationModel.supplicationId),
          ShareSupplicationButton(dataSupplication: _supplicationText(arabic: widget.supplicationModel.arabicText, transcription: widget.supplicationModel.transcriptionText, translation: widget.supplicationModel.translationText)),
          Container(
            padding: AppStyles.paddingHorVerMicro,
            decoration: BoxDecoration(
              color: appColors.secondaryContainer,
              borderRadius: AppStyles.borderMini,
            ),
            child: Text(
              widget.supplicationModel.supplicationId.toString(),
              style: AppStyles.mainTextStyle17,
            ),
          ),
        ],
      ),
    );
  }
  String _supplicationText({required String? arabic, required String? transcription, required String translation}) {
    String parseHtmlString(String htmlString) {
      final document = html_parser.parse(htmlString);
      return document.body!.text;
    }
    String translationText = parseHtmlString(translation);
      return [
      if (arabic != null && arabic.isNotEmpty) arabic,
      if (transcription != null && transcription.isNotEmpty) transcription,
      if (translationText.isNotEmpty) translationText,
    ].join('\n\n');
  }
}
