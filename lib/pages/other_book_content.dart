import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/other_book_content_arguments.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/widget/other_content.dart';
import 'package:provider/provider.dart';

class OtherBookContent extends StatelessWidget {
  const OtherBookContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as OtherBookContentArguments?;
    return Scaffold(
      backgroundColor: context.watch<MainState>().getNightThemeState
          ? Colors.blueGrey[900]
          : Colors.white,
      appBar: AppBar(
        backgroundColor: context.watch<MainState>().getNightThemeState
            ? Colors.green[900]
            : Colors.green[400],
        title: Text('${args!.otherContentTitle}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: OtherContent(content: args.otherContent!),
    );
  }
}
