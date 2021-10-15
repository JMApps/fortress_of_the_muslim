import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
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
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(15),
      ),
      prefix: Padding(
        padding: const EdgeInsets.all(8),
        child: const Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
      ),
      placeholder: 'Поиск',
      placeholderStyle: const TextStyle(color: Colors.grey),
      style: TextStyle(fontFamily: 'Gilroy', color: Colors.grey[800]),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }
}