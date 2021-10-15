import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider<MainSupplicationState>(create: (_) => MainSupplicationState()),
      ],
      child: InkWell(
        child: Scaffold(
          backgroundColor: Color(0xFFFFEBEE),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Все дуа',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
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
                onPressed: () {
                  int randomNumber = random.nextInt(280);
                  context.read<MainSupplicationState>().getItemScrollController.scrollTo(
                          index: randomNumber,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOutCubic);
                },
                icon: const Icon(CupertinoIcons.arrow_3_trianglepath),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.red,
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