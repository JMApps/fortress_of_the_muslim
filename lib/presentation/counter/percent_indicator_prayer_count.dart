import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentIndicatorPrayerCount extends StatelessWidget {
  const PercentIndicatorPrayerCount({super.key});

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterState>();
    return CircularPercentIndicator(
      radius: 165,
      lineWidth: 16,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: counterState.getPrayerCountColor,
      percent: counterState.getPrayerCountNumber / 100,
      center: IconButton(
        onPressed: () {
          context.read<CounterState>().onCounterButtonTap();
        },
        padding: EdgeInsets.zero,
        splashRadius: 135,
        iconSize: 325,
        splashColor: counterState.getPrayerCountColor,
        color: counterState.getPrayerCountColor,
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        icon: const Icon(
          Icons.fiber_manual_record,
        ),
      ),
    );
  }
}
