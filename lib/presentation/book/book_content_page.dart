import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BookContentPage extends StatelessWidget {
  const BookContentPage({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Html(
          data: 'Simple text',
        ),
      ),
    );
  }
}
