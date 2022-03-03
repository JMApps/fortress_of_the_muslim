import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/widget/favorite_supplication_list.dart';
import 'package:provider/provider.dart';

class FavoriteSupplications extends StatelessWidget {
  const FavoriteSupplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteSupplicationState>(
            create: (_) => FavoriteSupplicationState()),
      ],
      child: Scaffold(
        backgroundColor: context.watch<MainState>().getNightThemeState
            ? Colors.blueGrey[900]
            : Colors.blue[50],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Избранные дуа',
            style: TextStyle(
              color: context.watch<MainState>().getNightThemeState
                  ? Colors.blue[50]
                  : Colors.white,
            ),
          ),
          backgroundColor: context.watch<MainState>().getNightThemeState
              ? Colors.blue[900]
              : Colors.blue[400],
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed('/other_content');
            },
            icon: const Icon(CupertinoIcons.square_list),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.info_outline),
          //     onPressed: () {
          //       Navigator.of(context, rootNavigator: true)
          //           .pushNamed('/about_us');
          //     },
          //   ),
          // ],
        ),
        body: Scrollbar(
          child: FavoriteSupplicationList(),
        ),
      ),
    );
  }
}
