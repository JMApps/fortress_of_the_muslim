import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/main_chapter_search_state.dart';
import 'package:provider/provider.dart';

class MainChapterSearch extends StatelessWidget {
  const MainChapterSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 55,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xff3f968c),
      ),
      child: CupertinoTextField(
        autocorrect: true,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        onChanged: (value) {
          context.read<MainChapterSearchState>().getCurrentKeyWord(value);
        },
        prefix: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
        ),
        placeholder: 'Поиск по главам...',
        placeholderStyle: const TextStyle(
          color: Colors.grey,
        ),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
