import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class OtherContent extends StatelessWidget {
  const OtherContent({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
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
                    '#': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: const FontSize(18),
                    ),
                    'small': Style(
                      color: Colors.grey,
                      fontSize: const FontSize(12),
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
          data: content,
          style: {
            '#': Style(
                padding: const EdgeInsets.all(8),
                margin: EdgeInsets.zero,
                textAlign: TextAlign.justify,
                color: Colors.grey[800],
                fontSize: const FontSize(20),
                fontFamily: 'Gilroy'),
            'a': Style(
              fontSize: const FontSize(16),
              color: Colors.blue,
            ),
            'small': Style(
              fontSize: const FontSize(10),
              color: Colors.grey,
            ),
          },
        ),
      ),
    );
  }
}
