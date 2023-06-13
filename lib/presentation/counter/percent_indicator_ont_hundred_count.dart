import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentIndicatorOneHundredCount extends StatelessWidget {
  const PercentIndicatorOneHundredCount({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    return CircularPercentIndicator(
      radius: 165,
      lineWidth: 16,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: themeColors.mainSupplicationsColor.withOpacity(0.75),
      percent: context.watch<CounterState>().getOneHundredCountNumber / 100,
      center: IconButton(
        onPressed: () {
          context.read<CounterState>().onCounterButtonTap();
        },
        padding: EdgeInsets.zero,
        splashRadius: 135,
        iconSize: 325,
        splashColor: themeColors.mainSupplicationsColor.withOpacity(0.25),
        color: themeColors.mainSupplicationsColor,
        tooltip: AppStrings.counter,
        icon: const Icon(
          Icons.fiber_manual_record,
        ),
      ),
    );
  }
}
