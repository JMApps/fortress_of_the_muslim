import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';
import '../widgets/counter_options_container.dart';
import '../widgets/finger_print_container.dart';
import '../widgets/text_value_container.dart';

class AppCounterPage extends StatelessWidget {
  const AppCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppCounterState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.counter),
        ),
        body: OrientationLayoutBuilder(
          portrait: (context) => Padding(
            padding: AppStyles.paddingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextValueContainer(
                  textColor: appColors.primary,
                ),
                Flexible(
                  child: FingerPrintContainer(
                    iconColor: appColors.primary,
                  ),
                ),
                CounterOptionsContainer(),
              ],
            ),
          ),
          landscape: (context) => Padding(
            padding: AppStyles.paddingMini,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Flexible(
                        child: TextValueContainer(
                          textColor: appColors.primary,
                        ),
                      ),
                      CounterOptionsContainer(),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: FingerPrintContainer(
                    iconColor: appColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
