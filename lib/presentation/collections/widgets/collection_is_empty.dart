import 'package:flutter/cupertino.dart';

import '../../../core/styles/app_styles.dart';

class CollectionIsEmpty extends StatelessWidget {
  const CollectionIsEmpty({
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
              CupertinoIcons.collections_solid,
              color: color.withOpacity(0.25),
              size: 200,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
