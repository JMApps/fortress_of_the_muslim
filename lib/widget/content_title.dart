import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentTitle extends StatelessWidget {
  const ContentTitle({Key? key, required this.contentTitle}) : super(key: key);

  final String contentTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Html(
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
        data: contentTitle,
        style: {
          '#': Style(
            fontSize: const FontSize(18),
            padding: EdgeInsets.zero,
            color: Colors.white,
            margin: EdgeInsets.zero,
            textAlign: TextAlign.center,
          ),
          'a': Style(
            fontSize: const FontSize(13),
            color: Colors.blue,
          ),
          'small': Style(
            fontSize: const FontSize(10),
            color: Colors.grey,
          ),
        },
      ),
    );
  }
}
