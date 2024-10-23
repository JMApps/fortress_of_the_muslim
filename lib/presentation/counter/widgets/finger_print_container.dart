import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';

class FingerPrintContainer extends StatelessWidget {
  const FingerPrintContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () {
          Provider.of<AppCounterState>(context, listen: false).onCountClick();
        },
        splashColor: appColors.secondary,
        icon: Icon(
          Icons.fingerprint_rounded,
          color: appColors.secondary,
          size: mediaQuery.orientation == Orientation.portrait ? mediaQuery.size.width * 0.75 : mediaQuery.size.height * 0.6,
        ),
      ),
    );
  }
}
