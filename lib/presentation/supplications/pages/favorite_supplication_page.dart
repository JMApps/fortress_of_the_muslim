import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/name_routes.dart';
import '../../states/app_player_state.dart';
import '../../widgets/fab_to_start.dart';
import '../../states/scroll_page_state.dart';
import '../lists/favorite_supplications_list.dart';

class FavoriteSupplicationPage extends StatefulWidget {
  const FavoriteSupplicationPage({super.key});

  @override
  State<FavoriteSupplicationPage> createState() => _FavoriteSupplicationPageState();
}

class _FavoriteSupplicationPageState extends State<FavoriteSupplicationPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScrollPageState>(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.favoriteSupplications),
          leading: IconButton(
            onPressed: () {
              Provider.of<AppPlayerState>(context, listen: false).stopTrack();
              Navigator.of(context).pop();
            },
            tooltip: appLocale.back,
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          actions: [
            IconButton.filledTonal(
              onPressed: () {
                Provider.of<AppPlayerState>(context, listen: false).stopTrack();
                Navigator.pushNamed(
                  context,
                  NameRoutes.settingsContentPage,
                );
              },
              tooltip: appLocale.settings,
              icon: Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: const FavoriteSupplicationsList(),
        floatingActionButton: FabTopStart(
          fabColor: Colors.blue.withOpacity(0.35),
        ),
      ),
    );
  }
}
