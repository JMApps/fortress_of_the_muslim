import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../states/scroll_page_state.dart';

class FabTopStart extends StatelessWidget {
  const FabTopStart({
    super.key,
    required this.fabColor,
  });

  final Color fabColor;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<ScrollPageState>(
      builder: (context, scrollPageState, _) {
        return ValueListenableBuilder<double>(
          valueListenable: scrollPageState.getButtonOpacity,
          builder: (context, buttonOpacity, child) {
            return AnimatedOpacity(
              opacity: buttonOpacity,
              duration: const Duration(milliseconds: 150),
              child: FloatingActionButton(
                elevation: 0,
                onPressed: scrollPageState.getToTop,
                backgroundColor: fabColor,
                tooltip: appLocale.toStart,
                child: const Icon(Icons.arrow_upward_rounded),
              ),
            );
          },
        );
      },
    );
  }
}
