import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class FavoriteIsEmpty extends StatelessWidget {
  const FavoriteIsEmpty({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.paddingBottom75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark,
              color: color.withOpacity(0.25),
              size: 200,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
