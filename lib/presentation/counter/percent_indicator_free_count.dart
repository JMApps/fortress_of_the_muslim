import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class PercentIndicatorFreeCount extends StatelessWidget {
  const PercentIndicatorFreeCount({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {
        context.read<CounterState>().onCounterButtonTap();
      },
      splashRadius: 145,
      iconSize: 375,
      splashColor: themeColors.mainChaptersColor.withOpacity(0.25),
      padding: EdgeInsets.zero,
      color: themeColors.mainSupplicationsColor,
      tooltip: AppStrings.counter,
      icon: const Icon(
        Icons.fiber_manual_record,
      ),
    );
  }
}
