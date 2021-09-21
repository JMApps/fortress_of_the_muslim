import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/other_book_content_arguments.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';

class OtherBookContent extends StatefulWidget {
  const OtherBookContent({Key? key}) : super(key: key);

  @override
  _OtherBookContentState createState() => _OtherBookContentState();
}

class _OtherBookContentState extends State<OtherBookContent> {
  var _textStyles = TextStyles();
  late OtherBookContentArguments? args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments
        as OtherBookContentArguments?;
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: Text('${args!.otherContentTitle}'),
          centerTitle: true,
          elevation: 0,
        ),
        body: _buildItem(args!.otherContent));
  }

  Widget _buildItem(content) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Html(
            onLinkTap: (String? url, RenderContext rendContext,
                Map<String, String> attributes, element) {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  message: Html(
                    data: url,
                    style: {
                      "small": Style(
                        color: Colors.grey,
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
            data: content,
            style: {
              "#": Style(
                  textAlign: TextAlign.justify,
                  color: Colors.grey[800],
                  fontSize: FontSize(20),
                  fontFamily: 'Gilroy'),
              "small": _textStyles.smallTextTextStyle,
              "a": _textStyles.footnoteTextStyle,
            },
          ),
        ),
      ),
    );
  }
}
