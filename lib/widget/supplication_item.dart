import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';
import 'package:fortress_of_the_muslim/provider/main_supplication_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final SupplicationModelItem item;
  final int index;

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
          item.contentArabic != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.contentArabic,
                      style: TextStyle(
                          fontSize: 21, // Change with shared preferences
                          fontFamily: 'Hafs'),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                )
              : SizedBox(),
          item.contentTranscription != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.contentTranscription,
                      style: TextStyle(
                        fontSize: 18, // Change with shared preferences
                      ), //
                    ),
                  ),
                )
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
                        fontSize: FontSize(18),
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
                  fontSize: const FontSize(18),
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  margin: EdgeInsets.zero),
              'a': Style(
                fontSize: const FontSize(16),
                color: Colors.blue,
              ),
              'small': Style(
                fontSize: const FontSize(10),
                color: Colors.grey,
              ),
            },
          ),
          Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Дуа ${item.id}/280',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              IconButton(
                  icon: const Icon(CupertinoIcons.doc_on_doc),
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
                icon: const Icon(CupertinoIcons.share),
                color: Colors.grey,
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
                icon: Icon(
                  item.favoriteState == 0
                      ? CupertinoIcons.bookmark
                      : CupertinoIcons.bookmark_fill,
                ),
                color: Colors.red,
                onPressed: () {
                  context.read<MainSupplicationState>().updateBookmarkState(
                      item.favoriteState == 0 ? 1 : 0, item.id);
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
        backgroundColor: isBookmark ? item.favoriteState == 0 ? Colors.blue : Colors.red : Colors.red,
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
