import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:provider/provider.dart';

class TextOneHundredCounterNumber extends StatelessWidget {
  const TextOneHundredCounterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CounterState>().getOneHundredCountNumber.toString(),
      style: Theme.of(context).textTheme.labelLarge,
      textAlign: TextAlign.center,
    );
  }
}
