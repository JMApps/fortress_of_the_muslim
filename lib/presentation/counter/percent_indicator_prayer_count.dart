import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PercentIndicatorPrayerCount extends StatelessWidget {
  const PercentIndicatorPrayerCount({super.key});

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterState>();
    final themeColors = Theme.of(context).colorScheme;
    return CircularStepProgressIndicator(
      totalSteps: 99,
      currentStep: counterState.getPrayerCountNumber,
      stepSize: 35,
      padding: pi / 30,
      width: 325,
      height: 325,
      selectedStepSize: 45,
      circularDirection: CircularDirection.counterclockwise,
      selectedColor: counterState.getPrayerCountColor,
      unselectedColor: counterState.getPrayerCountColor.withOpacity(0.25),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(500),
        ),
        color: themeColors.mainSupplicationsColor,
        child: InkWell(
          onTap: () {
            context.read<CounterState>().onCounterButtonTap();
          },
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(500),
        ),
      ),
    );
  }
}
