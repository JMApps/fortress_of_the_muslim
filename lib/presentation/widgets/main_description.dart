import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainDescriptionText extends StatelessWidget {
  const MainDescriptionText({
    super.key,
    required this.descriptionText,
  });

  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: Text(
        descriptionText,
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
