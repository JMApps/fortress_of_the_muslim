import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:share/share.dart';

class FavoriteSupplications extends StatefulWidget {
  @override
  _FavoriteSupplicationsState createState() => _FavoriteSupplicationsState();
}

class _FavoriteSupplicationsState extends State<FavoriteSupplications> {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2FAFD),
      appBar: AppBar(
        title: Text('Крепость мусульманина'),
        backgroundColor: Colors.blue[500],
        elevation: 0,
        actions: [],
      ),
      body: Scrollbar(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return FutureBuilder<List>(
      future: _databaseQuery.getFavoriteSupplications(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildSupplicationItem(snapshot.data![index]);
                },
              )
            : Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Избранных дуа нет',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    Icon(
                      Icons.bookmark,
                      color: Colors.blue[500],
                      size: 30,
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget _buildSupplicationItem(SupplicationItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(8),
      elevation: 1,
      child: Column(
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
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
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
                  style: _textStyles.favoriteSupplicationNumberTextStyle),
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
                  color: Colors.blue[500],
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
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
