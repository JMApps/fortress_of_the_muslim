import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/route/app_route.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/presentation/pages/main.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainState>(
          create: (_) => MainState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Крепость мусульманина',
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
        onGenerateRoute: AppRoute().onGeneratorRoute,
        home: const MainPage(),
      ),
    );
  }
}
