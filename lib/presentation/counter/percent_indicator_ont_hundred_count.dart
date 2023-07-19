import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PercentIndicatorOneHundredCount extends StatelessWidget {
  const PercentIndicatorOneHundredCount({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    return CircularStepProgressIndicator(
      totalSteps: 100,
      currentStep: context.watch<CounterState>().getOneHundredCountNumber,
      stepSize: 35,
      padding: pi / 30,
      width: MediaQuery.of(context).orientation == Orientation.portrait ? 325 : 275,
      height: MediaQuery.of(context).orientation == Orientation.portrait ? 325 : 275,
      selectedStepSize: 45,
      circularDirection: CircularDirection.counterclockwise,
      selectedColor: themeColors.mainSupplicationsColor,
      unselectedColor: themeColors.mainSupplicationsColor.withOpacity(0.25),
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
