import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../states/app_player_state.dart';
import '../supplications/widgets/favorite_supplication_button.dart';
import '../supplications/widgets/share_supplication_button.dart';
import 'play_speed_segment.dart';

class SupplicationMediaCard extends StatelessWidget {
  const SupplicationMediaCard({
    super.key,
    required this.supplicationModel,
    required this.supplicationIndex,
    required this.supplicationLength,
  });

  final SupplicationEntity supplicationModel;
  final int supplicationIndex;
  final int supplicationLength;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final isNameAudio = supplicationModel.nameAudio != null;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: AppStyles.shape,
      color: appColors.onSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<AppPlayerState>(
            builder: (context, playerState, _) {
              return Visibility(
                visible: isNameAudio,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: IconButton(
                  onPressed: () {
                    playerState.playTrack(audioName: supplicationModel.nameAudio!, trackId: supplicationModel.supplicationId);
                  },
                  icon: Icon(playerState.isPlaying && playerState.currentTrackId == supplicationModel.supplicationId ? CupertinoIcons.stop : CupertinoIcons.play),
                ),
              );
            },
          ),
          Consumer<AppPlayerState>(
            builder: (context, playerState, _) {
              return Visibility(
                visible: isNameAudio,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: IconButton(
                  onPressed: playerState.isPlaying && playerState.currentTrackId == supplicationModel.supplicationId ? () {
                    playerState.toggleRepeatMode(supplicationModel.supplicationId);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: appColors.secondaryContainer,
                        duration: const Duration(milliseconds: 500),
                        shape: AppStyles.shape,
                        elevation: 0,
                        content: Text(
                          playerState.isRepeating ? appLocale.repeatOn : appLocale.repeatOff,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: appColors.onSurface,
                          ),
                        ),
                      ),
                    );
                  } : null,
                  icon: Icon(
                      CupertinoIcons.arrow_2_squarepath,
                    color: playerState.isRepeating && playerState.currentTrackId == supplicationModel.supplicationId ? appColors.error : appColors.onSurface,
                  ),
                ),
              );
            },
          ),
          Visibility(
            visible: isNameAudio,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: PlaySpeedSegment(),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.speedometer),
            ),
          ),
          FavoriteSupplicationButton(supplicationId: supplicationModel.supplicationId),
          ShareSupplicationButton(supplicationId: supplicationModel.supplicationId, dataSupplication: _supplicationText(arabic: supplicationModel.arabicText, transcription: supplicationModel.transcriptionText, translation: supplicationModel.translationText)),
          Container(
            padding: AppStyles.paddingHorVerMicro,
            decoration: BoxDecoration(
              color: appColors.secondaryContainer,
              borderRadius: AppStyles.borderMini,
            ),
            child: Text(
              '$supplicationIndex/$supplicationLength',
              style: AppStyles.mainTextStyle17,
            ),
          ),
        ],
      ),
    );
  }

  String _supplicationText({required String? arabic, required String? transcription, required String translation}) {String parseHtmlString(String htmlString) {
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
