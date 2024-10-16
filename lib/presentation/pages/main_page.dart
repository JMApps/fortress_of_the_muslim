import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../widgets/first_main_three.dart';
import '../widgets/first_main_two.dart';
import '../widgets/last_chapter_card.dart';
import '../widgets/last_main_three.dart';
import '../widgets/second_main_three.dart';
import '../widgets/second_main_two.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: AppStrings.share,
            icon: Icon(Icons.ios_share),
          ),
        ],
      ),
      body: Container(
        height: screenHeight,
        padding: AppStyles.paddingMini,
        child: ClipRRect(
          borderRadius: AppStyles.borderBig,
          clipBehavior: Clip.hardEdge,
          child: OrientationLayoutBuilder(
            portrait: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 4,
                  child: FirstMainTwo(),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 4,
                  child: SecondMainTwo(),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 2,
                  child: FirstMainThree(),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 2,
                  child: SecondMainThree(),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 1,
                  child: LastChapterCard(),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 2,
                  child: LastMainThree(),
                ),
              ],
            ),
            landscape: (context) => Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: FirstMainTwo(),
                      ),
                      const SizedBox(height: 8),
                      LastChapterCard(),
                      const SizedBox(height: 8),
                      Expanded(
                        child: SecondMainTwo(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: FirstMainThree(),
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: SecondMainThree(),
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: LastMainThree(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
