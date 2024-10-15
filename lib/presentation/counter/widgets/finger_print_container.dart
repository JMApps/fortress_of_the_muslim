import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';

class FingerPrintContainer extends StatelessWidget {
  const FingerPrintContainer({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () {
          Provider.of<AppCounterState>(context, listen: false).onCountClick();
        },
        splashColor: iconColor,
        icon: Icon(
          Icons.fingerprint_rounded,
          color: iconColor.withOpacity(0.5),
          size: mediaQuery.orientation == Orientation.portrait ? mediaQuery.size.width * 0.85 : mediaQuery.size.height * 0.75,
        ),
      ),
    );
  }
}
