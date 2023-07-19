import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
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
    final themeColors = Theme.of(context).colorScheme;
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
                  shape: AppStyles.hardShape,
                  child: Padding(
                    padding: AppStyles.mainPadding,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInCubic,
                      switchOutCurve: Curves.easeInCubic,
                      child: Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: counterState.getShowCountNumber,
                        child: _countTexts[counterState.getDropDownValuesIndex]),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedSwitcher(
                  duration: (const Duration(milliseconds: 500)),
                  child: _countPercentIndicators[counterState.getDropDownValuesIndex],
                ),
                const SizedBox(height: 32),
                Card(
                  margin: AppStyles.mainMargin,
                  shape: AppStyles.hardShape,
                  color: themeColors.cardColor.withOpacity(0.75),
                  child: Row(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(left: 16),
                        shape: AppStyles.mainShape,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: IconButton(
                            onPressed: () {
                              counterState.showHideCountNumber();
                            },
                            splashRadius: 25,
                            tooltip: AppStrings.reset,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            color: counterState.getShowCountNumber ? themeColors.mainDefaultColor : themeColors.mainSupplicationsColor,
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: DropDownCounterValuesList(),
                      ),
                      Card(
                        margin: const EdgeInsets.only(right: 16),
                        shape: AppStyles.mainShape,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: IconButton(
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
                        ),
                      ),
                    ],
                  ),
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
