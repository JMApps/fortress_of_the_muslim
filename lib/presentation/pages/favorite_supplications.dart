import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/lists/favorite_supplication_list.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/favorite_supplications_app_bar.dart';
import 'package:provider/provider.dart';

class FavoriteSupplications extends StatefulWidget {
  const FavoriteSupplications({Key? key}) : super(key: key);

  @override
  State<FavoriteSupplications> createState() => _FavoriteSupplicationsState();
}

class _FavoriteSupplicationsState extends State<FavoriteSupplications> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
        ChangeNotifierProvider<AppPlayerState>(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: FavoriteSupplicationsAppBar(),
        ),
        body: FavoriteSupplicationList(),
      ),
    );
  }
}
