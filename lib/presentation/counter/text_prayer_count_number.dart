import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:provider/provider.dart';

class TextPrayerCounterNumber extends StatelessWidget {
  const TextPrayerCounterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CounterState>().getPrayerCountNumber.toString(),
      style: Theme.of(context).textTheme.labelLarge,
      textAlign: TextAlign.center,
    );
  }
}
