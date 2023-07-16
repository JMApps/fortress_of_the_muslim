import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/data/arguments/main_chapter_arguments.dart';

class SelectButtonCard extends StatelessWidget {
  const SelectButtonCard({
    super.key,
    required this.title,
    required this.icon,
    required this.pictureName,
    required this.chapterId,
  });

  final String title;
  final IconData icon;
  final String pictureName;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: AppStyles.mainShape,
      child: InkWell(
        onTap: () {
          if (chapterId == 222) {
            Navigator.pushNamed(context, '/counter_page');
          } else {
            Navigator.pushNamed(
              context,
              '/chapter_content_page',
              arguments: MainChapterArguments(
                chapterId: chapterId,
              ),
            );
          }
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainPadding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorder,
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: Theme.of(context).brightness == Brightness.dark ? 0.10 : 0.25,
              image: AssetImage('assets/pictures/$pictureName'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
