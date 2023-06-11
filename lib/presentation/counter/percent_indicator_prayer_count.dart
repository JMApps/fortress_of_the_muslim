import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentIndicatorPrayerCount extends StatelessWidget {
  const PercentIndicatorPrayerCount({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 165,
      lineWidth: 16,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: context.watch<CounterState>().getPrayerCountColor,
      percent: context.watch<CounterState>().getPrayerCountNumber / 100,
      center: IconButton(
        onPressed: () {
          context.read<CounterState>().onCounterButtonTap();
        },
        splashRadius: 135,
        iconSize: 325,
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
        color: Theme.of(context).colorScheme.mainSupplicationsColor,
        icon: const Icon(
          Icons.fiber_manual_record,
        ),
      ),
    );
  }
}
