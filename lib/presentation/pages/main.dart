import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/lists/main_items.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/main_app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  initState() {
    isRunChapters();
    super.initState();
  }

  isRunChapters() async {
    var mainSettingsBox = Hive.box(Constants.keyMainSettingBox);
    bool isRunChapters =
        mainSettingsBox.get(Constants.keyIsRunChapters) ?? false;
    if (isRunChapters) {
      Future.delayed(const Duration(milliseconds: 50)).then(
        (value) => {
          Navigator.of(context).pushNamed('main_chapters'),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: MainAppBar(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Theme.of(context)
                  .colorScheme
                  .mainChapterRowColor
                  .withOpacity(0.15),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
            image: const AssetImage('assets/icons/row_texture.jpeg'),
          ),
        ),
        child: const MainItems(),
      ),
    );
  }
}
