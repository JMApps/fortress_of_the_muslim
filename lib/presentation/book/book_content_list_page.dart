import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/arguments/book_content_arguments.dart';

class BookContentListPage extends StatelessWidget {
  const BookContentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bookContent),
        backgroundColor: themeColors.mainBookmarksColor,
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/footnote_page');
          //   },
          //   splashRadius: 20,
          //   icon: const Icon(CupertinoIcons.list_dash),
          // ),
        ],
      ),
      body: CupertinoScrollbar(
        child: ListView.separated(
          padding: AppStyles.symmetricVerticalPaddingMini,
          itemCount: AppStrings.bookChapters.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/book_content_page',
                  arguments: BookContentArguments(
                    index: index,
                    title: AppStrings.bookChapters[index],
                  ),
                );
              },
              title: Text(
                AppStrings.bookChapters[index],
                style: Theme.of(context).textTheme.labelMedium,
              ),
              visualDensity: const VisualDensity(vertical: -2),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(indent: 16, endIndent: 16);
          },
        ),
      ),
    );
  }
}
