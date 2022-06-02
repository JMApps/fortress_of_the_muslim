import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_chapter_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:provider/provider.dart';

class MainChapterItem extends StatelessWidget {
  const MainChapterItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MainChapterItemModel item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.id.isOdd ? Colors.white : Colors.grey[200],
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(
                icon: item.favoriteState == 0
                    ? const Icon(CupertinoIcons.bookmark)
                    : const Icon(CupertinoIcons.bookmark_fill),
                splashRadius: 22,
                splashColor: const Color(0xff81b9b0),
                color: const Color(0xff3f968c),
                onPressed: () {
                  context.read<MainState>().showSnackBarMessage(
                      context,
                      const Color(0xff3f968c),
                      item.favoriteState == 0 ? 'Добавлено' : 'Удалено');
                  context.read<BookmarkButtonState>().addRemoveChapterBookmark(
                      item.favoriteState == 0 ? 1 : 0, item.id);
                },
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Глава ${item.id}',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xff3f968c),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Html(
                    data: item.chapterSubTitle,
                    style: {
                      '#': Style(
                        fontSize: const FontSize(17),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
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
                            const Color(0xff3f968c),
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Переход на главу
        },
      ),
    );
  }
}
