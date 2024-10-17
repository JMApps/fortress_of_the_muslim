import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../states/content_settings_state.dart';
import '../states/supplication_count_state.dart';

class SupplicationCounterButton extends StatelessWidget {
  const SupplicationCounterButton({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<SupplicationCountState>(
      builder: (context, countState, _) {
        return InkWell(
          onTap: () => countState.onCountClick(),
          onLongPress: () => countState.resetCount(),
          borderRadius: AppStyles.borderBig,
          splashColor: appColors.inversePrimary.withOpacity(0.10),
          child: Row(
            mainAxisAlignment: AppStyles.counterAlign[Provider.of<ContentSettingsState>(context).getCounterAlignIndex],
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  countState.getSupplicationCount.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: appColors.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
