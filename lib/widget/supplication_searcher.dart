import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_supplication_state.dart';
import 'package:provider/provider.dart';

class SupplicationSearcher extends StatelessWidget {
  const SupplicationSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      autocorrect: true,
      onChanged: (String newString) {
        context.read<MainSupplicationState>().updateTextFiledData(newString);
      },
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      prefix: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
      ),
      placeholder: 'Поиск',
      placeholderStyle: TextStyle(color: Colors.grey[500]),
      style: TextStyle(fontFamily: 'Gilroy', color: Colors.grey[800]),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }
}