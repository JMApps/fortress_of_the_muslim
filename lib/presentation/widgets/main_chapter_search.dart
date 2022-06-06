import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/main_chapter_search_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MainChapterSearch extends StatelessWidget {
  const MainChapterSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 55,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.mainColor,
      ),
      child: CupertinoTextField(
        autocorrect: true,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.mainChapterSearchBackground,
        ),
        onChanged: (value) {
          context.read<MainChapterSearchState>().getCurrentKeyWord(value);
        },
        prefix: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: Theme.of(context).colorScheme.mainTitleColor,
          ),
        ),
        placeholder: 'Поиск по главам...',
        style: TextStyle(
          fontFamily: 'Gilroy',
          color: Theme.of(context).colorScheme.mainChapterSearchPlaceholder,
        ),
        placeholderStyle: TextStyle(
          fontFamily: 'Gilroy',
          color: Colors.grey.shade400,
        ),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
