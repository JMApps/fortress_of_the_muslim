import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/provider/main_supplication_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class SupplicationItem extends StatelessWidget {
  SupplicationItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final SupplicationModelItem item;
  final int index;

  final List<TextAlign> _getTextAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.watch<MainState>().getNightThemeState
          ? Colors.blueGrey[900]
          : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: Column(
        children: [
          item.contentArabic != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.contentArabic!,
                      style: TextStyle(
                        fontSize: context
                                .watch<AppSettingsState>()
                                .getArabicTextSize
                                .toDouble() +
                            3,
                        fontFamily: 'Hafs',
                        color: context.read<AppSettingsState>().getNightThemeColorState
                            ? context
                                .watch<AppSettingsState>()
                                .getArabicTextColor
                            : context.watch<MainState>().getNightThemeState
                                ? Colors.blueGrey[100]
                                : Colors.blueGrey[900],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                )
              : const SizedBox(),
          item.contentTranscription != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.contentTranscription!,
                      style: TextStyle(
                        fontSize: context
                            .watch<AppSettingsState>()
                            .getTranslationTextSize
                            .toDouble(),
                        color: context.read<AppSettingsState>().getNightThemeColorState
                            ? context
                                .watch<AppSettingsState>()
                                .getTranscriptionTextColor
                            : context.watch<MainState>().getNightThemeState
                                ? Colors.green[200]
                                : Colors.green[400],
                      ), //
                      textAlign: _getTextAlign[context
                          .watch<AppSettingsState>()
                          .getToggleButtonIndex],
                    ),
                  ),
                )
              : const SizedBox(),
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
                        fontSize: const FontSize(18),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                      ),
                      'small': Style(
                        color: Colors.grey,
                        fontSize: const FontSize(10),
                      ),
                    },
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text(
                        'Закрыть',
                        style: TextStyle(
                          color: context.watch<MainState>().getNightThemeState
                              ? Colors.red[900]
                              : Colors.red[400],
                        ),
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
                  fontSize: FontSize(context
                      .watch<AppSettingsState>()
                      .getTranslationTextSize
                      .toDouble()),
                  color: context.read<AppSettingsState>().getNightThemeColorState
                      ? context
                          .watch<AppSettingsState>()
                          .getTranslationTextColor
                      : context.watch<MainState>().getNightThemeState
                          ? Colors.white
                          : Colors.black,
                  textAlign: _getTextAlign[
                      context.watch<AppSettingsState>().getToggleButtonIndex],
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  margin: EdgeInsets.zero),
              'a': Style(
                fontSize: const FontSize(16),
                color: context.watch<MainState>().getNightThemeState
                    ? Colors.red[900]
                    : Colors.red[400],
              ),
              'small': Style(
                fontSize: const FontSize(10),
                color: Colors.grey,
              ),
            },
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Дуа ${item.id}/280',
                style: TextStyle(
                  fontSize: 16,
                  color: context.watch<MainState>().getNightThemeState
                      ? Colors.red[900]
                      : Colors.red[400],
                ),
              ),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.doc_on_doc,
                    color: context.watch<MainState>().getNightThemeState
                        ? Colors.red[50]
                        : Colors.grey,
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    FlutterClipboard.copy(
                      '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                      '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                      '${item.contentForCopyAndShare}',
                    );
                    _showMessage(context, false);
                  }),
              IconButton(
                icon: Icon(
                  CupertinoIcons.share,
                  color: context.watch<MainState>().getNightThemeState
                      ? Colors.red[50]
                      : Colors.grey,
                ),
                onPressed: () {
                  Share.share(
                    '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                    '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                    '${item.contentForCopyAndShare}',
                    sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  item.favoriteState == 0
                      ? CupertinoIcons.bookmark
                      : CupertinoIcons.bookmark_fill,
                ),
                color: context.watch<MainState>().getNightThemeState
                    ? Colors.red[900]
                    : Colors.red[400],
                onPressed: () {
                  context.read<MainSupplicationState>().updateBookmarkState(
                      item.favoriteState == 0 ? 1 : 0, item.id!);
                  _showMessage(context, true);
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  _showMessage(BuildContext context, bool isBookmark) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isBookmark
            ? item.favoriteState == 0
                ? context.read<MainState>().getNightThemeState
                    ? Colors.blue[900]
                    : Colors.blue[400]
                : context.read<MainState>().getNightThemeState
                    ? Colors.red[900]
                    : Colors.red[400]
            : Colors.red[400],
        content: isBookmark
            ? item.favoriteState == 0
                ? const Text(
                    'Добавлено',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Удалено',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
            : const Text(
                'Скопировано',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
