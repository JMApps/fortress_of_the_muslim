import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
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
                  margin: AppStyles.mainMargin,
                  child: Padding(
                    padding: AppStyles.mainPadding,
                    child: _countTexts[counterState.getDropDownValuesIndex],
                  ),
                ),
                const SizedBox(height: 32),
                _countPercentIndicators[counterState.getDropDownValuesIndex],
                const SizedBox(height: 32),
                const DropDownCounterValuesList(),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
