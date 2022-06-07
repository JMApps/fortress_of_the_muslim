import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/main_supplication_search_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MainSupplicationSearch extends StatelessWidget {
  const MainSupplicationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Container(
      width: double.maxFinite,
      height: 55,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.supplicationRowColor,
      ),
      child: CupertinoTextField(
        autocorrect: true,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: myColor.searchBackgroundColor,
        ),
        onChanged: (value) {
          context.read<MainSupplicationSearchState>().getCurrentKeyWord(value);
        },
        prefix: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: myColor.mainSupplicationTitleColor,
          ),
        ),
        placeholder: 'Поиск по дуа...',
        style: TextStyle(
          fontFamily: 'Gilroy',
          color: myColor.searchPlaceholderColor,
        ),
        placeholderStyle: const TextStyle(
          fontFamily: 'Gilroy',
          color: Colors.grey,
        ),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
