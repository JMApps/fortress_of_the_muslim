import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/content/content_chapter_supplication_item.dart';
import 'package:provider/provider.dart';

class ChapterContentPage extends StatelessWidget {
  const ChapterContentPage({
    super.key,
    required this.chapterId,
  });

  final int chapterId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.chapterContentSupplicationsBackgroundColor,
      body: FutureBuilder<List>(
        future: context.watch<MainChaptersState>().getDatabaseQuery.getChapterContentSupplications(chapterId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text('${AppStrings.head} $chapterId'),
                      floating: true,
                      backgroundColor: theme.colorScheme.chapterContentSupplicationsColor,
                    ),
                    SliverToBoxAdapter(
                      child: Card(
                        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        elevation: 0,
                        child: Padding(
                          padding: AppStyles.mainPadding,
                          child: Text(
                            'OK',
                            style: theme.textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int itemIndex) {
                        return ContentChapterSupplicationItem(
                          item: snapshot.data![itemIndex],
                          itemIndex: itemIndex,
                        );
                      }, childCount: snapshot.data!.length),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
