import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/main_chapters_state.dart';
import '../../widgets/main_description.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_chapter_item.dart';

class SearchFuture extends StatefulWidget {
  const SearchFuture({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchFuture> createState() => _SearchFutureState();
}

class _SearchFutureState extends State<SearchFuture> {
  late Future<List<ChapterEntity>> _futureChapters;
  List<ChapterEntity> _chapters = [];
  List<ChapterEntity> _recentChapters = [];

  @override
  void initState() {
    _futureChapters = Provider.of<MainChaptersState>(context, listen: false).getAllChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChapterEntity>>(
      future: _futureChapters,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return const MainDescriptionText(
            descriptionText: AppStrings.searchIsEmpty,
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          _chapters = snapshot.data!;
          _recentChapters = widget.query.isEmpty ? _chapters : _chapters.where((element) =>
          element.chapterId.toString().contains(widget.query) || element.chapterNumber.toLowerCase().contains(widget.query) || element.chapterTitle.toLowerCase().contains(widget.query)).toList();
          return _recentChapters.isEmpty ? const MainDescriptionText(descriptionText: AppStrings.searchIsEmpty) : Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingMini,
              itemCount: _recentChapters.length,
              itemBuilder: (BuildContext context, int index) {
                return MainChapterItem(
                  chapterModel: _recentChapters[index],
                  chapterIndex: index,
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
