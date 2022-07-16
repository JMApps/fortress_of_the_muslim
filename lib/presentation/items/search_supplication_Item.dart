import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/main_supplication_share_copy_popup.dart';
import 'package:provider/provider.dart';

class SearchSupplicationItem extends StatelessWidget {
  const SearchSupplicationItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MainSupplicationItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<ChapterContentSettingsState>(
      builder: (context, chapterContentSettings, _) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.all(8),
          color: item.id.isOdd ? myColor.firstIs0dd : myColor.secondIs0dd,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                item.contentArabic != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${item.contentArabic}',
                            style: TextStyle(
                              fontSize:
                                  chapterContentSettings.getTextArabicSize + 5,
                              fontFamily: 'Hafs',
                              color: chapterContentSettings.getIsDefaultColors
                                  ? Color(
                                      chapterContentSettings.getArabicTextColor)
                                  : myColor.textArabicColor,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                    : const SizedBox(),
                item.contentTranscription != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Text(
                          '${item.contentTranscription}',
                          style: TextStyle(
                            fontSize: chapterContentSettings
                                .getTextTranslateSize
                                .toDouble(),
                            color: chapterContentSettings.getIsDefaultColors
                                ? Color(chapterContentSettings
                                    .getTranscriptionTextColor)
                                : myColor.textTranscriptionColor,
                          ),
                          textAlign: chapterContentSettings.getMyTextAlign[
                              chapterContentSettings.getToggleTextAlignIndex],
                        ),
                      )
                    : const SizedBox(),
                Html(
                  data: item.contentTranslation,
                  style: {
                    '#': Style(
                      fontSize: FontSize(chapterContentSettings
                          .getTextTranslateSize
                          .toDouble()),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      color: chapterContentSettings.getIsDefaultColors
                          ? Color(chapterContentSettings.getTranslateTextColor)
                          : myColor.textTranslateColor,
                      textAlign: chapterContentSettings.getMyTextAlign[
                          chapterContentSettings.getToggleTextAlignIndex],
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
                        context, url, myColor.mainSupplicationTitleColor);
                  },
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Дуа №${item.id}',
                      style: TextStyle(
                        color: myColor.mainSupplicationTitleColor,
                        fontSize: 16,
                      ),
                    ),
                    // IconButton(
                    //   splashRadius: 22,
                    //   padding: EdgeInsets.zero,
                    //   constraints: const BoxConstraints(),
                    //   color: myColor.mainSupplicationTitleColor,
                    //   icon: item.favoriteState == 0
                    //       ? const Icon(Icons.bookmark_border)
                    //       : const Icon(Icons.bookmark),
                    //   onPressed: () {
                    //     context.read<MainState>().showSnackBarMessage(
                    //         context,
                    //         myColor.mainSupplicationTitleColor,
                    //         item.favoriteState == 0 ? 'Добавлено' : 'Удалено');
                    //     context.read<BookmarkButtonState>()
                    //         .addRemoveSupplicationBookmark(
                    //         item.favoriteState == 0 ? 1 : 0, item.id);
                    //   },
                    // ),
                    IconButton(
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return MainSupplicationShareCopyPopup(
                              item: item,
                              color: myColor.mainSupplicationTitleColor,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
