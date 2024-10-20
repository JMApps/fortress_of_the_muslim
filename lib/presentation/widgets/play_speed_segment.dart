import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../states/app_player_state.dart';

class PlaySpeedSegment extends StatelessWidget {
  const PlaySpeedSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.paddingWithoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.playSpeed,
            style: AppStyles.mainTextStyle17Bold,
          ),
          const SizedBox(height: 8),
          Consumer<AppPlayerState>(
            builder: (context, playerState, _) {
              return SegmentedButton<int>(
                showSelectedIcon: false,
                segments: List.generate(
                  AppStrings.playSpeedNames.length,
                      (index) => ButtonSegment(
                    value: index,
                    label: Text(
                      AppStrings.playSpeedNames[index].toString(),
                      style: AppStyles.mainTextStyle17,
                    ),
                  ),
                ),
                selected: {playerState.getPlaySpeedIndex},
                onSelectionChanged: (newIndex) {
                  playerState.setPlaySpeedIndex = newIndex.first;
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
