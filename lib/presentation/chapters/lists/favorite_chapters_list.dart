import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/app_settings_state.dart';
import '../../states/main_chapters_state.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/favorite_is_empty.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/favorite_chapter_item.dart';

class FavoriteChaptersList extends StatefulWidget {
  const FavoriteChaptersList({super.key});

  @override
  State<FavoriteChaptersList> createState() => _FavoriteChaptersListState();
}

class _FavoriteChaptersListState extends State<FavoriteChaptersList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FutureBuilder<List<ChapterEntity>>(
      future: Provider.of<MainChaptersState>(context, listen: false).getFavoriteChapters(languageCode: AppConstraints.appLocales[Provider.of<AppSettingsState>(context, listen: false).getAppLocaleIndex].languageCode, ids: Provider.of<MainChaptersState>(context).getFavoriteChapterIds),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return FavoriteIsEmpty(
            text: appLocale.favoriteChaptersIsEmpty,
            color: Colors.orange,
          );
        }
        if (snapshot.hasData) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
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
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
