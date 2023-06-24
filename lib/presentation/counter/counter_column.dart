import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/counter/dropdown_counter_values_list.dart';
import 'package:fortress_of_the_muslim/presentation/counter/percent_indicator_free_count.dart';
import 'package:fortress_of_the_muslim/presentation/counter/percent_indicator_ont_hundred_count.dart';
import 'package:fortress_of_the_muslim/presentation/counter/percent_indicator_prayer_count.dart';
import 'package:fortress_of_the_muslim/presentation/counter/text_free_count_number.dart';
import 'package:fortress_of_the_muslim/presentation/counter/text_one_hundred_count_number.dart';
import 'package:fortress_of_the_muslim/presentation/counter/text_prayer_count_number.dart';
import 'package:provider/provider.dart';

class CounterColumn extends StatefulWidget {
  const CounterColumn({super.key});

  @override
  State<CounterColumn> createState() => _CounterColumnState();
}

class _CounterColumnState extends State<CounterColumn> {
  static const List _countTexts = [
    TextFreeCounterNumber(),
    TextPrayerCounterNumber(),
    TextOneHundredCounterNumber(),
  ];

  static const List _countPercentIndicators = [
    PercentIndicatorFreeCount(),
    PercentIndicatorPrayerCount(),
    PercentIndicatorOneHundredCount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Consumer<CounterState>(
          builder: (context, counterState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Card(
                  margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: AppStyles.mainPadding,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _countTexts[counterState.getDropDownValuesIndex],
                      switchInCurve: Curves.easeInCubic,
                      switchOutCurve: Curves.easeInCubic,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedSwitcher(
                  duration: (const Duration(milliseconds: 500)),
                  child: _countPercentIndicators[
                  counterState.getDropDownValuesIndex],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    const Expanded(
                      child: DropDownCounterValuesList(),
                    ),
                    IconButton(
                      onPressed: () {
                        counterState.resetCounterButtonTap();
                      },
                      splashRadius: 25,
                      tooltip: AppStrings.reset,
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                      icon: const Icon(Icons.replay),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
