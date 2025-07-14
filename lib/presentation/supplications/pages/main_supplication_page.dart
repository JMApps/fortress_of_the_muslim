import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/app_player_state.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/main_supplications_list.dart';
import '../widgets/search_supplications_delegate.dart';

class MainSupplicationPage extends StatelessWidget {
  const MainSupplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScrollPageState>(
          create: (_) => ScrollPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.allSupplications),
          leading: IconButton(
            onPressed: () {
              Provider.of<AppPlayerState>(context, listen: false).stopTrack();
              Navigator.of(context).pop();
            },
            tooltip: appLocale.back,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                Provider.of<AppPlayerState>(context, listen: false).stopTrack();
                await Navigator.pushNamed(
                  context,
                  NameRoutes.settingsContentPage,
                );
              },
              tooltip: appLocale.settings,
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () async {
                Provider.of<AppPlayerState>(context, listen: false).stopTrack();
                await showSearch(
                  context: context,
                  delegate: SearchSupplicationsDelegate(
                    search: appLocale.search,
                    tableName: appLocale.supplicationsTableName,
                  ),
                );
              },
              tooltip: appLocale.search,
              icon: const Icon(CupertinoIcons.search),
            ),
          ],
        ),
        body: MainSupplicationsList(tableName: appLocale.supplicationsTableName),
        floatingActionButton: FabTopStart(
          fabColor: Colors.red.withAlpha(155),
        ),
      ),
    );
  }
}
