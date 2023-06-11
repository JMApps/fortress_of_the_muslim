import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:provider/provider.dart';

class DropDownCounterValuesList extends StatelessWidget {
  const DropDownCounterValuesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterState>(
      builder: (context, counterState, _) {
        return Card(
          margin: AppStyles.mainMargin,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              value: AppStrings.counterValuesList[counterState.getDropDownValuesIndex],
              borderRadius: AppStyles.mainBorder,
              elevation: 1,
              isExpanded: true,
              alignment: AlignmentDirectional.center,
              style: Theme.of(context).textTheme.labelMedium,
              underline: const SizedBox(),
              onChanged: (String? value) {
                counterState.setDropDownValuesIndex = AppStrings.counterValuesList.indexOf(value!);
              },
              items: AppStrings.counterValuesList.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}
