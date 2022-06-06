import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/main_supplication_search_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MainSupplicationSearch extends StatelessWidget {
  const MainSupplicationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 55,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.supplicationColor,
      ),
      child: CupertinoTextField(
        autocorrect: true,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.mainSupplicationSearchBackground,
        ),
        onChanged: (value) {
          context.read<MainSupplicationSearchState>().getCurrentKeyWord(value);
        },
        prefix: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: Theme.of(context).colorScheme.supplicationColor,
          ),
        ),
        placeholder: 'Поиск по дуа...',
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
