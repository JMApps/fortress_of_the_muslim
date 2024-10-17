import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/main_chapters_state.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/favorite_is_empty.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/favorite_chapter_item.dart';

class FavoriteChaptersList extends StatelessWidget {
  const FavoriteChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChapterEntity>>(
      future: Provider.of<MainChaptersState>(context, listen: false).getFavoriteChapters(ids: Provider.of<MainChaptersState>(context).getFavoriteChapterIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return const FavoriteIsEmpty(
            text: AppStrings.favoriteChaptersIsEmpty,
            color: Colors.orange,
          );
        }
        return Scrollbar(
          controller: Provider.of<ScrollPageState>(context, listen: false).getScrollController,
          child: ListView.builder(
            controller: Provider.of<ScrollPageState>(context, listen: false).getScrollController,
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
      },
    );
  }
}
