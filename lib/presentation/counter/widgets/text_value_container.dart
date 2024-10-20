import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/app_counter_state.dart';

class TextValueContainer extends StatelessWidget {
  const TextValueContainer({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: AppStyles.paddingMini,
      shape: AppStyles.shape,
      child: Consumer<AppCounterState>(
        builder: (context, appCounter, _) {
          return AnimatedOpacity(
            opacity: appCounter.getValueShowState ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: Text(
                appCounter.getCountValue(),
                key: ValueKey<String>(appCounter.getCountValue()),
                style: TextStyle(
                  fontSize: int.parse(appCounter.getCountValue()) > 100000 ? 50 : 100,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppStrings.fontGilroy,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
