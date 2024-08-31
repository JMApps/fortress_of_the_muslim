import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class AppOptionsCard extends StatelessWidget {
  const AppOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.zero,
      shape: AppStyles.shapeMini,
      elevation: 0,
      child: ListTile(
        title: Text('Настройки'),
      ),
    );
  }
}
