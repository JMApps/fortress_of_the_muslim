import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainErrorTextData extends StatelessWidget {
  const MainErrorTextData({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: Text(
        errorText,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.error,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}