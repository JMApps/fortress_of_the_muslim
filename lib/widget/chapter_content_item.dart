import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ChapterContentItem extends StatelessWidget {
  const ChapterContentItem({
    Key? key,
    required this.item,
    required this.index,
    required this.length,
  }) : super(key: key);

  final SupplicationModelItem item;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(8),
      elevation: 1,
      child: Column(
        children: [
          context.watch<AppSettingsState>().getIsArabicTextShow
              ? item.contentArabic != null
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          item.contentArabic!,
                          style: TextStyle(
                            fontSize: context
                                    .watch<AppSettingsState>()
                                    .getTextSize
                                    .toDouble() +
                                3,
                            fontFamily: 'Hafs',
                            color: context
                                .watch<AppSettingsState>()
                                .getArabicTextColor,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
          context.watch<AppSettingsState>().getIsTranscriptionTextShow
              ? item.contentTranscription != null
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, right: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.contentTranscription!,
                          style: TextStyle(
                            fontSize: context
                                .watch<AppSettingsState>()
                                .getTextSize
                                .toDouble(),
                            color: context
                                .watch<AppSettingsState>()
                                .getTranscriptionTextColor,
                          ), //
                        ),
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
          Html(
            onLinkTap: (String? url, RenderContext rendContext,
                Map<String, String> attributes, element) {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  message: Html(
                    data: url,
                    style: {
                      '#': Style(
                        fontSize: FontSize(context
                            .watch<AppSettingsState>()
                            .getTextSize
                            .toDouble()),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                      ),
                      'small': Style(
                        color: Colors.grey,
                        fontSize: FontSize(10),
                      ),
                    },
                  ),
                  actions: [
                    CupertinoButton(
                      child: const Text(
                        'Закрыть',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            data: item.contentTranslation,
            style: {
              '#': Style(
                  fontSize: FontSize(
                      context.watch<AppSettingsState>().getTextSize.toDouble()),
                  color:
                      context.watch<AppSettingsState>().getTranslationTextColor,
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  margin: EdgeInsets.zero),
              'a': Style(
                fontSize: const FontSize(14),
                color: Colors.blue,
              ),
              'small': Style(
                fontSize: const FontSize(10),
                color: Colors.grey,
              ),
            },
          ),
          SizedBox(height: 8),
          Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Дуа ${index + 1}/$length',
                style: const TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.play_circle),
                color: Colors.blueGrey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.doc_on_doc),
                color: Colors.blueGrey,
                onPressed: () {
                  FlutterClipboard.copy(
                    '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                    '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                    '${item.contentForCopyAndShare}',
                  );
                  _showMessage(context, false);
                },
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.share),
                color: Colors.blueGrey,
                onPressed: () {
                  Share.share(
                    '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                    '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                    '${item.contentForCopyAndShare}',
                    sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
                  );
                },
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.photo),
                color: Colors.blueGrey,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  item.favoriteState == 0
                      ? CupertinoIcons.bookmark
                      : CupertinoIcons.bookmark_fill,
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  context.read<FavoriteSupplicationState>().updateBookmarkState(
                      item.favoriteState == 0 ? 1 : 0, item.id!);
                  _showMessage(context, true);
                },
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  _showMessage(BuildContext context, bool isBookmark) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(8),
        backgroundColor: isBookmark
            ? item.favoriteState == 0
                ? Colors.blue
                : Colors.blueGrey
            : Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        content: isBookmark
            ? item.favoriteState == 0
                ? const Text(
                    'Добавлено',
                    style: TextStyle(fontSize: 18),
                  )
                : const Text(
                    'Удалено',
                    style: TextStyle(fontSize: 18),
                  )
            : const Text(
                'Скопировано',
                style: TextStyle(fontSize: 18),
              ),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}