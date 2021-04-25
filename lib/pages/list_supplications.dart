import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:share/share.dart';

class ListSupplications extends StatefulWidget {
  @override
  _ListSupplicationsState createState() => _ListSupplicationsState();
}

class _ListSupplicationsState extends State<ListSupplications> {
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.red[500],
            child: _buildSearch(),
          ),
          Expanded(
            child: Scrollbar(
              child: _buildList(),
            ),
          ),
        ],
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
        borderRadius: BorderRadius.circular(10),
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
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey[700],
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _buildSupplicationItem(snapshot.data[index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildSupplicationItem(SupplicationItem item) {
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
                })
          ],
        )
      ],
    );
  }
}
