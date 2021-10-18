import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/other_book_content_arguments.dart';
import 'package:fortress_of_the_muslim/widget/other_content.dart';

class OtherBookContent extends StatelessWidget {
  const OtherBookContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OtherBookContentArguments?;
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${args!.otherContentTitle}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: OtherContent(content: args.otherContent!),
    );
  }
}
