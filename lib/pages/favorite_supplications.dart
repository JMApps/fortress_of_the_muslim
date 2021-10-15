import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/widget/favorite_supplication_list.dart';
import 'package:provider/provider.dart';

class FavoriteSupplications extends StatelessWidget {
  FavoriteSupplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteSupplicationState>(create: (_) => FavoriteSupplicationState()),
      ],
      child: Scaffold(
        backgroundColor: Color(0xFFE3F2FD),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Избранные дуа',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed('/other_content');
            },
            icon: Icon(CupertinoIcons.square_list),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // About us page
              },
            ),
          ],
        ),
        body: Scrollbar(
          thickness: 5,
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: FavoriteSupplicationList(),
        ),
      ),
    );
  }
}
