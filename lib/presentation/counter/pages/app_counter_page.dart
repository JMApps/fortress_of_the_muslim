import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';
import '../widgets/counter_options_container.dart';
import '../widgets/counter_values_dropdown.dart';
import '../widgets/finger_print_container.dart';
import '../widgets/text_value_container.dart';

class AppCounterPage extends StatelessWidget {
  const AppCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppCounterState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.counter),
        ),
        body: OrientationLayoutBuilder(
          portrait: (context) => const Padding(
            padding: AppStyles.paddingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextValueContainer(),
                Expanded(
                  child: FingerPrintContainer(),
                ),
                CounterValuesDropdown(),
                SizedBox(height: 16),
                CounterOptionsContainer(),
                SizedBox(height: 16),
              ],
            ),
          ),
          landscape: (context) => const Padding(
            padding: AppStyles.paddingMini,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: TextValueContainer(),
                      ),
                      SizedBox(height: 8),
                      CounterValuesDropdown(),
                      SizedBox(height: 8),
                      CounterOptionsContainer(),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FingerPrintContainer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
