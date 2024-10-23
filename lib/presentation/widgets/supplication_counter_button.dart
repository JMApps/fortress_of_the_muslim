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
          borderRadius: AppStyles.border,
          child: Row(
            mainAxisAlignment: AppStyles.counterAlign[Provider.of<ContentSettingsState>(context).getCounterAlignIndex],
            children: [
              SizedBox(
                height: 125,
                width: 125,
                child: FilledButton.tonal(
                  onPressed: () => countState.onCountClick(),
                  onLongPress: () => countState.resetCount(),
                  child: Padding(
                    padding: AppStyles.paddingTopMini,
                    child: Text(
                      countState.getSupplicationCount.toString(),
                      style: TextStyle(
                        fontSize: 42.5,
                        fontWeight: FontWeight.bold,
                        color: appColors.primary,
                      ),
                    ),
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
