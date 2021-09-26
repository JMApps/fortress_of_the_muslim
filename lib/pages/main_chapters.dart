import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/model/chapter_item.dart';
import 'package:fortress_of_the_muslim/pages/support_project_page.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:fortress_of_the_muslim/widget/chapter_settings.dart';

class MainChapters extends StatefulWidget {
  @override
  _MainChaptersState createState() => _MainChaptersState();
}

class _MainChaptersState extends State<MainChapters> {
  var _databaseQuery = DatabaseQuery();
  final _textController = TextEditingController();
  var _textStyles = TextStyles();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    return InkWell(
      child: Scaffold(
        backgroundColor: Color(0xFFF2FFFE),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Крепость мусульманина'),
          backgroundColor: Colors.teal[500],
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed('/other_content');
            },
            icon: Icon(CupertinoIcons.square_list),
          ),
          actions: [
            Platform.isAndroid ? SupportProjectPage() : SizedBox(),
            ChapterSettings(),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.teal[500],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: _buildSearch(),
            ),
            Expanded(
              child: Scrollbar(
                child: _buildList(),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
    );
  }

  Widget _buildSearch() {
    return CupertinoTextField(
      controller: _textController,
      autocorrect: true,
      onChanged: (String text) {
        setState(() {});
      },
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      prefix: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          CupertinoIcons.search,
          color: Colors.teal[500],
        ),
      ),
      placeholder: 'Поиск глав...',
      placeholderStyle: TextStyle(color: Colors.grey[500]),
      style: TextStyle(fontFamily: 'Gilroy', color: Colors.grey[800]),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  Widget _buildList() {
    return FutureBuilder<List>(
      future: _textController.text.isEmpty
          ? _databaseQuery.getAllChapters()
          : _databaseQuery.getChapterSearchResult(_textController.text),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey[500],
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _buildChapterItem(snapshot.data![index], index);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildChapterItem(ChapterItem item, int index) {
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
                color: Colors.teal[500],
                onPressed: () {
                  setState(() {
                    item.favoriteState == 0
                        ? _databaseQuery.addRemoveFavoriteChapter(1, item.id)
                        : _databaseQuery.addRemoveFavoriteChapter(0, item.id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor:
                          item.favoriteState == 0 ? Colors.teal : Colors.red,
                      content: item.favoriteState == 0
                          ? Text(
                              'Добавлено',
                              style: TextStyle(fontSize: 18),
                            )
                          : Text(
                              'Удалено',
                              style: TextStyle(fontSize: 18),
                            ),
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
                      style: _textStyles.mainChapterNumberTextStyle),
                ),
                Html(
                  onLinkTap: (String? url, RenderContext rendContext,
                      Map<String, String> attributes, element) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        message: Html(
                          data: url,
                          style: {
                            "small": Style(
                              color: Colors.grey[500],
                              fontSize: FontSize(12),
                            ),
                            '#': Style(
                              fontSize: FontSize(18),
                            )
                          },
                        ),
                        actions: [
                          CupertinoButton(
                            child: Text('Закрыть'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
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
        Navigator.of(context, rootNavigator: true).pushNamed(
          item.id == 27 ? '/day_night_supplications' : '/content_chapter',
          arguments: ChapterArguments(item.id, item.chapterTitle),
        );
      },
    );
  }
}
