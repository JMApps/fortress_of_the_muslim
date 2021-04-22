import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/chapter_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';

class FavoriteChapters extends StatefulWidget {
  @override
  _FavoriteChaptersState createState() => _FavoriteChaptersState();
}

class _FavoriteChaptersState extends State<FavoriteChapters> {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return FutureBuilder<List>(
      future: _databaseQuery.getFavoriteChapters(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey[500],
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _buildChapterItem(snapshot.data[index]);
                },
              )
            : Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Избранных глав нет',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    Icon(
                      Icons.bookmark,
                      color: Colors.orange[500],
                      size: 30,
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget _buildChapterItem(ChapterItem item) {
    return InkWell(
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 0, right: 0, bottom: 0),
            child: IconButton(
                icon: item.favoriteState == 0
                    ? Icon(CupertinoIcons.bookmark)
                    : Icon(CupertinoIcons.bookmark_solid),
                color: Colors.orange[500],
                onPressed: () {
                  setState(() {
                    item.favoriteState == 0
                        ? _databaseQuery.addRemoveFavoriteChapter(1, item.id)
                        : _databaseQuery.addRemoveFavoriteChapter(0, item.id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: item.favoriteState == 0
                          ? Text('Добавлено')
                          : Text('Удалено'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, right: 0, bottom: 0),
                  child: Text('Глава ${item.id.toString()}',
                      style: _textStyles.mainFavoriteChapterNumberTextStyle),
                ),
                Html(
                  onLinkTap: (String url) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(url),
                      ),
                    );
                  },
                  data: item.chapterTitle,
                  style: {
                    "#": _textStyles.mainChapterTitleTextStyle,
                    "a": _textStyles.footnoteTextStyle
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        // Navigator.of(context, rootNavigator: true).pushNamed(
        //   '/chapter_content',
        //   arguments: ChapterArguments(item.id, item.chapterTitle),
        // );
      },
    );
  }
}
