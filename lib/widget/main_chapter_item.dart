import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/model/chapter_model_item.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:provider/provider.dart';

class MainChapterItem extends StatelessWidget {
  MainChapterItem({Key? key, required this.item, required this.index})
      : super(key: key);

  final ChapterModelItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(item.favoriteState == 0
            ? CupertinoIcons.bookmark
            : CupertinoIcons.bookmark_solid),
        color: Colors.teal,
        onPressed: () {
          context.read<MainChapterState>().updateBookmarkState(item.favoriteState == 0 ? 1 : 0, item.id);
          _showSnackBar(context);
        },
      ),
      title: Text(
        'Глава ${item.id}',
        style: TextStyle(
          color: Colors.teal,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Html(
        onLinkTap: (String? url, RenderContext rendContext,
            Map<String, String> attributes, element) {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
              message: Html(
                data: url,
                style: {
                  '#': Style(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    fontSize: const FontSize(18),
                  ),
                  'small': Style(
                    color: Colors.grey,
                    fontSize: const FontSize(10),
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
        data: '${item.chapterTitle}',
        style: {
          '#': Style(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            fontSize: const FontSize(19),
          ),
          'a': Style(
            fontSize: const FontSize(16),
            color: Colors.blue,
          ),
        },
      ),
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          item.id == 27 ? '/day_night_supplications' : '/content_chapter',
          arguments: ChapterArguments(item.id, item.chapterTitle),
        );
      },
    );
  }

  _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: item.favoriteState == 0 ? Colors.orange : Colors.teal,
        content: item.favoriteState == 0
            ? const Text(
                'Добавлено',
                style: TextStyle(fontSize: 18),
              )
            : const Text(
                'Удалено',
                style: TextStyle(fontSize: 18),
              ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
