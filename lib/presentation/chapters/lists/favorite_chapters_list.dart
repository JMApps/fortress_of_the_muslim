import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/states/main_chapters_state.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../widgets/favorite_is_empty.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/favorite_chapter_item.dart';

class FavoriteChaptersList extends StatefulWidget {
  const FavoriteChaptersList({super.key});

  @override
  State<FavoriteChaptersList> createState() => _FavoriteChaptersListState();
}

class _FavoriteChaptersListState extends State<FavoriteChaptersList> {
  late Future<List<ChapterEntity>> _futureChapters;

  @override
  void initState() {
    _futureChapters = Provider.of<MainChaptersState>(context, listen: false).getFavoriteChapters(ids: []);
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
          return const FavoriteIsEmpty(
            text: AppStrings.favoriteChaptersIsEmpty,
            color: Colors.teal,
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final ChapterEntity chapterModel = snapshot.data![index];
                return FavoriteChapterItem(
                  chapterModel: chapterModel,
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
