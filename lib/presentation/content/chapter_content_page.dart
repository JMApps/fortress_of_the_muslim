import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/content/content_chapter_supplication_item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
        backgroundColor: theme.colorScheme.chapterContentSupplicationsBackgroundColor,
        body: FutureBuilder<List>(
          future: context.watch<MainChaptersState>().getDatabaseQuery.getChapterContentSupplications(chapterId),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.hasData
                ? CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        centerTitle: true,
                        title: Text('${AppStrings.head} $chapterId'),
                        floating: true,
                        backgroundColor:
                            theme.colorScheme.chapterContentSupplicationsColor,
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/content_settings_page');
                            },
                            splashRadius: 20,
                            icon: const Icon(
                              CupertinoIcons.settings,
                            ),
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: FutureBuilder<List>(
                          future: context.read<MainChaptersState>().getDatabaseQuery.getOneChapter(chapterId),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<dynamic>> snapshot) {
                            return snapshot.hasData
                                ? Card(
                                    margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                    elevation: 0,
                                    color: theme.colorScheme.chapterContentSupplicationsColor,
                                    child: Padding(
                                      padding: AppStyles.mainPadding,
                                      child: ForHtmlText(
                                        textData: snapshot.data?[0].chapterTitle,
                                        textSize: 17,
                                        textColor: Colors.white,
                                        fontFamily: 'Gilroy',
                                        footnoteColor: theme.colorScheme.mainChaptersColor,
                                        textDataAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : Card(
                                    margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                    elevation: 0,
                                    color: theme.colorScheme.chapterContentSupplicationsColor,
                                    child: const Padding(
                                      padding: AppStyles.mainPadding,
                                      child: CircularProgressIndicator.adaptive(),
                                    ),
                                  );
                          },
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int itemIndex) {
                            return ContentChapterSupplicationItem(
                              item: snapshot.data![itemIndex],
                              itemIndex: itemIndex,
                              itemsLength: snapshot.data!.length,
                            );
                          },
                          childCount: snapshot.data!.length,
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ),
      ),
    );
  }
}
