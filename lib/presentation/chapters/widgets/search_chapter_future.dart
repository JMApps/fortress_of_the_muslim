import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/main_chapters_state.dart';
import '../../widgets/main_description.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_chapter_item.dart';

class SearchChaptersFuture extends StatefulWidget {
  const SearchChaptersFuture({
    super.key,
    required this.query,
    required this.tableName,
  });

  final String query;
  final String tableName;

  @override
  State<SearchChaptersFuture> createState() => _SearchChaptersFutureState();
}

class _SearchChaptersFutureState extends State<SearchChaptersFuture> {
  late final Future<List<ChapterEntity>> _futureMainChapters;
  List<ChapterEntity> _chapters = [];
  List<ChapterEntity> _recentChapters = [];

  @override
  void initState() {
    _futureMainChapters = Provider.of<MainChaptersState>(context, listen: false).fetchAllChapters(tableName: widget.tableName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FutureBuilder<List<ChapterEntity>>(
      future: _futureMainChapters,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return MainDescriptionText(
            descriptionText: appLocale.searchIsEmpty,
          );
        }
        if (snapshot.hasData) {
          _chapters = snapshot.data!;
          _recentChapters = widget.query.isEmpty ? _chapters : _chapters.where((element) =>
          element.chapterId.toString().contains(widget.query) || element.chapterNumber.toLowerCase().contains(widget.query) || element.chapterTitle.toLowerCase().contains(widget.query)).toList();
          return _recentChapters.isEmpty ? MainDescriptionText(descriptionText: appLocale.searchIsEmpty) : Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingWithoutTopMini,
              itemCount: _recentChapters.length,
              itemBuilder: (BuildContext context, int index) {
                return MainChapterItem(
                  chapterModel: _recentChapters[index],
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
