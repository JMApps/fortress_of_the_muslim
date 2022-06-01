import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MainState with ChangeNotifier {
  showSnackBarMessage(BuildContext context, Color color, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        duration: const Duration(milliseconds: 850),
      ),
    );
  }

  showFootNoteDialog(BuildContext context, String? content, Color color) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: Html(
          data: content,
          style: {
            '#': Style(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              fontSize: const FontSize(18),
            ),
            'small': Style(
              color: Colors.grey,
              fontSize: const FontSize(10),
            ),
          },
        ),
        actions: [
          CupertinoButton(
            child: Text(
              'Закрыть',
              style: TextStyle(
                color: color,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
