import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/app_counter_state.dart';

class CounterOptionsContainer extends StatelessWidget {
  const CounterOptionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<AppCounterState>(
      builder: (context, appCounter, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton.filledTonal(
              onPressed: () {
                appCounter.setValueShowState = !appCounter.getValueShowState;
              },
              icon: Icon(
                Icons.remove_red_eye_rounded,
                color: appCounter.getValueShowState ? appColors.secondary : appColors.error,
                size: 30,
              ),
            ),
            IconButton.filledTonal(
              onPressed: () {
                appCounter.setHapticState = !appCounter.getHapticState;
              },
              icon: Icon(
                Icons.vibration_rounded,
                color: appCounter.getHapticState ? appColors.secondary : appColors.error,
                size: 30,
              ),
            ),
            IconButton.filledTonal(
              onPressed: () {
                appCounter.resetCounter();
              },
              icon: Icon(
                Icons.replay_circle_filled_rounded,
                color: appColors.secondary,
                size: 30,
              ),
            ),
          ],
        );
      },
    );
  }
}
