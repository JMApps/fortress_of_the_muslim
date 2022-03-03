import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:provider/provider.dart';

class MainSearcher extends StatelessWidget {
  const MainSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      autocorrect: true,
      onChanged: (String newString) {
        context.read<MainChapterState>().updateTextFiledData(newString);
      },
      decoration: BoxDecoration(
        color: context.watch<MainState>().getNightThemeState
            ? Colors.blueGrey[800]
            : Colors.teal[50],
        borderRadius: BorderRadius.circular(15),
      ),
      prefix: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          CupertinoIcons.search,
          color: context.watch<MainState>().getNightThemeState
              ? Colors.blueGrey[50]
              : Colors.grey[800],
        ),
      ),
      placeholder: 'Поиск',
      placeholderStyle: TextStyle(
        color: context.watch<MainState>().getNightThemeState
            ? Colors.blueGrey[50]
            : Colors.grey[800],
      ),
      style: TextStyle(
        fontFamily: 'Gilroy',
        color: context.watch<MainState>().getNightThemeState
            ? Colors.blueGrey[50]
            : Colors.grey[800],
      ),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }
}
