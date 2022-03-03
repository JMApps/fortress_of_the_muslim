import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/provider/main_supplication_state.dart';
import 'package:fortress_of_the_muslim/widget/supplication_list.dart';
import 'package:fortress_of_the_muslim/widget/supplication_searcher.dart';
import 'package:provider/provider.dart';

class ListSupplications extends StatelessWidget {
  ListSupplications({Key? key}) : super(key: key);
  final random = Random();

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainSupplicationState>(
            create: (_) => MainSupplicationState()),
      ],
      child: InkWell(
        child: Scaffold(
          backgroundColor: context.watch<MainState>().getNightThemeState
              ? Colors.blueGrey[900]
              : Colors.red[50],
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Все дуа',
              style: TextStyle(
                color: context.watch<MainState>().getNightThemeState
                    ? Colors.red[50]
                    : Colors.white,
              ),
            ),
            backgroundColor: context.watch<MainState>().getNightThemeState
                ? Colors.red[900]
                : Colors.red[400],
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed('/other_content');
              },
              icon: Icon(
                CupertinoIcons.square_list,
                color: context.watch<MainState>().getNightThemeState
                    ? Colors.red[50]
                    : Colors.white,
              ),
            ),
            actions: [
              Consumer<MainSupplicationState>(
                builder: (context, mainSupplicationState, _) => IconButton(
                  onPressed: () {
                    int randomNumber = random.nextInt(280);
                    mainSupplicationState.scrollTo(randomNumber);
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_3_trianglepath,
                    color: context.watch<MainState>().getNightThemeState
                        ? Colors.red[50]
                        : Colors.white,
                  ),
                ),
              ),
              // IconButton(
              //   icon: const Icon(Icons.info_outline),
              //   onPressed: () {
              //     Navigator.of(context, rootNavigator: true)
              //         .pushNamed('/about_us');
              //   },
              // ),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.watch<MainState>().getNightThemeState
                      ? Colors.red[900]
                      : Colors.red[400],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: const SupplicationSearcher(),
              ),
              Expanded(
                child: Scrollbar(
                  child: SupplicationList(),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (!_currentFocus.hasPrimaryFocus) {
            _currentFocus.unfocus();
          }
        },
      ),
    );
  }
}
