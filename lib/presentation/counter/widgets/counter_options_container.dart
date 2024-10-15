import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';

class CounterOptionsContainer extends StatelessWidget {
  const CounterOptionsContainer({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: Consumer<AppCounterState>(
        builder: (context, appCounter, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButton<int>(
                iconEnabledColor: appColors.primary,
                borderRadius: AppStyles.border,
                dropdownColor: appColors.onSecondary,
                elevation: 1,
                icon: SizedBox(),
                isExpanded: true,
                alignment: Alignment.centerRight,
                value: appCounter.getValuesIndex,
                items: List.generate(
                  AppStrings.counterValues.length,
                      (index) => DropdownMenuItem<int>(
                    value: index,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: appColors.onSecondary.withOpacity(0.25),
                        borderRadius: AppStyles.border,
                      ),
                      child: Text(
                        AppStrings.counterValues[index],
                        style: AppStyles.mainTextStyle18Bold,
                      ),
                    ),
                  ),
                ),
                onChanged: (int? newIndex) {
                  appCounter.setValuesIndex = newIndex!;
                },
                underline: Container(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton.tonal(
                    onPressed: () {
                      appCounter.setValueShowState = !appCounter.getValueShowState;
                    },
                    child: Icon(
                      Icons.remove_red_eye_rounded,
                      color: appCounter.getValueShowState ? appColors.secondary : appColors.error,
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      appCounter.setVibrationState = !appCounter.getVibrationState;
                    },
                    child: Icon(
                      Icons.vibration_rounded,
                      color: appCounter.getVibrationState ? appColors.secondary : appColors.error,
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      appCounter.resetCounter();
                    },
                    child: Icon(
                      Icons.replay_circle_filled_rounded,
                      color: appColors.secondary,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
