import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class LastChapterCard extends StatelessWidget {
  const LastChapterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderMini,
        side: BorderSide(
          color: Theme.of(context).colorScheme.inversePrimary,
          width: 2.5,
        ),
      ),
      elevation: 0,
      child: ListTile(
        onTap: () {},
        shape: AppStyles.shapeMini,
        title: const Text(
          'Продолжить чтение 1 главы',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
