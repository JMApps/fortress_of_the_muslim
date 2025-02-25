import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/main_chapters_state.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_chapter_item.dart';

class MainChaptersList extends StatefulWidget {
  const MainChaptersList({
    super.key,
    required this.tableName,
  });

  final String tableName;

  @override
  State<MainChaptersList> createState() => _MainChaptersListState();
}

class _MainChaptersListState extends State<MainChaptersList> {
  late final ScrollController _scrollController;
  late final Future<List<ChapterEntity>> _futureChapters;

  @override
  void initState() {
    super.initState();
    _scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
    _futureChapters = Provider.of<MainChaptersState>(context, listen: false).fetchAllChapters(tableName: widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChapterEntity>>(
      future: _futureChapters,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              padding: AppStyles.paddingWithoutTopMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final ChapterEntity chapterModel = snapshot.data![index];
                return MainChapterItem(
                  chapterModel: chapterModel,
                  chapterIndex: index,
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
