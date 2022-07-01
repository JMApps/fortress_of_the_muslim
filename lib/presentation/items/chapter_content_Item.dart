import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/chapter_content_bottom_buttons.dart';
import 'package:provider/provider.dart';

class ChapterContentItem extends StatelessWidget {
  const ChapterContentItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ChapterContentItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<ChapterContentSettingsState>(
      builder: (context, chapterContentSettings, _) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.all(8),
          color: item.id.isOdd ? myColor.firstIs0dd : myColor.secondIs0dd,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Visibility(
                  visible: true,
                  maintainAnimation: false,
                  maintainSize: false,
                  child: item.contentArabic != null
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
                                    chapterContentSettings.getTextArabicSize +
                                        5,
                                fontFamily: 'Hafs',
                                color: chapterContentSettings.getIsDefaultColors
                                    ? Color(chapterContentSettings
                                        .getArabicTextColor)
                                    : myColor.textArabicColor,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                Visibility(
                  visible: chapterContentSettings.getIsTranscriptionShow,
                  maintainAnimation: false,
                  maintainSize: false,
                  child: item.contentTranscription != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
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
                                  chapterContentSettings
                                      .getToggleTextAlignIndex],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
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
                          context,
                          url,
                          myColor.contentChapterTitleColor,
                        );
                  },
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black),
                const SizedBox(height: 8),
                ChapterContentBottomButtons(item: item),
              ],
            ),
          ),
        );
      },
    );
  }
}
