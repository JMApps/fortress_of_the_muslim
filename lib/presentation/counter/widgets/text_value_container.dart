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
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: AppStyles.shape,
        child: Center(
          child: Consumer<AppCounterState>(
            builder: (context, appCounter, _) {
              return Visibility(
                visible: appCounter.getValueShowState,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Text(
                  appCounter.getCountValue(),
                  style: TextStyle(
                    fontSize: int.parse(appCounter.getCountValue()) > 100000 ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.fontGilroy,
                    color: textColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
