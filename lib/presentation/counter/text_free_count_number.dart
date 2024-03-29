import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:provider/provider.dart';

class TextFreeCounterNumber extends StatelessWidget {
  const TextFreeCounterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CounterState>().getFreeCountNumber.toString(),
      style: const TextStyle(
        fontSize: 75,
      ),
      textAlign: TextAlign.center,
    );
  }
}
