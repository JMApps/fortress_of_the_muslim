import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';

class CounterValuesDropdown extends StatelessWidget {
  const CounterValuesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<AppCounterState>(
      builder: (BuildContext context, appCounter, _) {
        return Card(
          elevation: 0,
          color: appColors.onSecondary,
          shape: AppStyles.shape,
          child: DropdownButton<int>(
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
                    style: AppStyles.mainTextStyle17Bold,
                  ),
                ),
              ),
            ),
            onChanged: (int? newIndex) {
              appCounter.setValuesIndex = newIndex!;
            },
            underline: Container(),
          ),
        );
      },
    );
  }
}
