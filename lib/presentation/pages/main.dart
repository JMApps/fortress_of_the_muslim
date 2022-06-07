import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/lists/main_items.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/main_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.maxFinite,
          50,
        ),
        child: MainAppBar(),
      ),
      body: MainItems(),
    );
  }
}
