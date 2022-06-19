import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ChapterContentSubTitle extends StatelessWidget {
  const ChapterContentSubTitle({
    Key? key,
    required this.databaseQuery,
    required this.chapterId,
  }) : super(key: key);

  final DatabaseQuery databaseQuery;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: databaseQuery.getOneChapter(chapterId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                  right: 8,
                ),
                padding: const EdgeInsets.all(8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.chapterContentColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Html(
                  data: snapshot.data![0].chapterTitle,
                  style: {
                    '#': Style(
                      fontSize: const FontSize(17),
                      textAlign: TextAlign.center,
                      color: Colors.white,
                    ),
                    'small': Style(
                      fontSize: const FontSize(8),
                    ),
                    'a': Style(
                      fontSize: const FontSize(14),
                      color: Colors.blue,
                    ),
                  },
                  onLinkTap: (String? url, RenderContext rendContext,
                      Map<String, String> attributes, element) {
                    context.read<MainState>().showFootNoteDialog(
                          context,
                          url,
                          Theme.of(context).colorScheme.chapterContentItemColor,
                        );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
