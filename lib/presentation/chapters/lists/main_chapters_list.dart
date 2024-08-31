import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../data/states/main_chapters_state.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_chapter_item.dart';

class MainChaptersList extends StatelessWidget {
  const MainChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChapterEntity>>(
      future: Provider.of<MainChaptersState>(context).getAllChapters(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingMini,
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
        } else if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
