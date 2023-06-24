import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class PercentIndicatorFreeCount extends StatelessWidget {
  const PercentIndicatorFreeCount({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 325,
      height: 325,
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
