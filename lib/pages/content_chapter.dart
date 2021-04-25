import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:share/share.dart';

class ContentChapter extends StatefulWidget {
  @override
  _ContentChapterState createState() => _ContentChapterState();
}

class _ContentChapterState extends State<ContentChapter> {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();

  @override
  Widget build(BuildContext context) {
    final ChapterArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        title: Text('Глава ${args.chapterId}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey[200],
            child: Html(
              data: args.chapterTitle,
              style: {
                "#": Style(textAlign: TextAlign.center, fontSize: FontSize(18))
              },
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: _buildList(args.chapterId),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.blueGrey[200],
      //   padding: EdgeInsets.all(8),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //           icon: Icon(CupertinoIcons.backward_end), onPressed: () {}),
      //       IconButton(icon: Icon(CupertinoIcons.play), onPressed: () {}),
      //       IconButton(
      //           icon: Icon(CupertinoIcons.forward_end), onPressed: () {}),
      //       Text('00:35', style: TextStyle(color: Colors.blueGrey[500]))
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildList(int chapterId) {
    return FutureBuilder<List>(
      future: _databaseQuery.getContentChapter(chapterId),
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
                  return _buildContentChapterItem(snapshot.data[index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildContentChapterItem(SupplicationItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        item.contentArabic != null
            ? Padding(
                padding: EdgeInsets.all(16),
                child: Text(item.contentArabic,
                    style: _textStyles.supplicationArabicTextStyle,
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl),
              )
            : SizedBox(),
        item.contentTranscription != null
            ? Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  item.contentTranscription,
                  style: _textStyles.supplicationTranscriptionTextStyle,
                ),
              )
            : SizedBox(),
        Padding(
          padding: EdgeInsets.all(8),
          child: Html(
            onLinkTap: (String url) {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  message: Html(
                    data: url,
                    style: {"small": Style(color: Colors.grey[500])},
                  ),
                ),
              );
            },
            data: item.contentTranslation,
            style: {
              "#": _textStyles.supplicationTranslationTextStyle,
              "a": _textStyles.footnoteTextStyle,
              "small": _textStyles.smallTextTextStyle,
            },
          ),
        ),
        Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.grey[500],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Дуа ${item.id}',
                style: _textStyles.contentChapterNumberTextStyle),
            // IconButton(
            //     icon: Icon(CupertinoIcons.play),
            //     color: Colors.grey[500],
            //     onPressed: () {}),
            IconButton(
                icon: Icon(CupertinoIcons.doc_on_doc),
                color: Colors.grey[500],
                onPressed: () {
                  FlutterClipboard.copy('${item.contentArabic}\n\n'
                          '${item.contentTranscription}\n\n'
                          '${item.contentForCopyAndShare}')
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Скопировано'),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  });
                }),
            IconButton(
                icon: Icon(CupertinoIcons.share),
                color: Colors.grey[500],
                onPressed: () {
                  Share.share('${item.contentArabic}\n\n'
                      '${item.contentTranscription}\n\n'
                      '${item.contentForCopyAndShare}');
                }),
            IconButton(
                icon: item.favoriteState == 0
                    ? Icon(CupertinoIcons.bookmark)
                    : Icon(CupertinoIcons.bookmark_fill),
                color: Colors.blueGrey[500],
                onPressed: () {
                  setState(() {
                    item.favoriteState == 0
                        ? _databaseQuery.addRemoveFavoriteSupplication(
                            1, item.id)
                        : _databaseQuery.addRemoveFavoriteSupplication(
                            0, item.id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: item.favoriteState == 0
                          ? Text('Добавлено')
                          : Text('Удалено'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                })
          ],
        )
      ],
    );
  }
}
