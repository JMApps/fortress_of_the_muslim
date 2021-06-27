import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';

class ListSupplications extends StatefulWidget {
  @override
  _ListSupplicationsState createState() => _ListSupplicationsState();
}

class _ListSupplicationsState extends State<ListSupplications> {
  var _databaseQuery = DatabaseQuery();
  final _textController = TextEditingController();
  var _textStyles = TextStyles();
  final itemScrollController = ItemScrollController();

  var random = Random();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    return InkWell(
      child: Scaffold(
        backgroundColor: Color(0xFFFDF2F7),
        appBar: AppBar(
          title: Text('Крепость мусульманина'),
          backgroundColor: Colors.red[500],
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                int randomNumber = random.nextInt(280);
                itemScrollController.scrollTo(
                    index: randomNumber,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutCubic);
              },
              icon: Icon(CupertinoIcons.arrow_3_trianglepath),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.red[500],
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
          color: Colors.red[500],
        ),
      ),
      placeholder: 'Поиск дуа...',
      placeholderStyle: TextStyle(color: Colors.grey[500]),
      style: TextStyle(fontFamily: 'Gilroy', color: Colors.grey[800]),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  Widget _buildList() {
    return FutureBuilder<List>(
      future: _textController.text.isEmpty
          ? _databaseQuery.getAllSupplications()
          : _databaseQuery.getSupplicationSearchResult(_textController.text),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ScrollablePositionedList.builder(
                physics: BouncingScrollPhysics(),
                itemScrollController: itemScrollController,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildSupplicationItem(snapshot.data![index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
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
              Text('Дуа ${item.id}/280',
                  style: _textStyles.supplicationNumberTextStyle),
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
                  color: Colors.red[500],
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
                  }),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
