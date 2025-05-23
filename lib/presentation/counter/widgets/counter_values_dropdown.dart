import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';

class CounterValuesDropdown extends StatelessWidget {
  const CounterValuesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
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
            icon: const SizedBox(),
            isExpanded: true,
            alignment: Alignment.centerRight,
            value: appCounter.getValuesIndex,
            items: List.generate(
              appLocale.counterValues.split(', ').length,
                  (index) => DropdownMenuItem<int>(
                value: index,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appColors.onSecondary.withAlpha(75),
                    borderRadius: AppStyles.border,
                  ),
                  child: Text(
                    appLocale.counterValues.split(', ')[index],
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
