import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/routes/name_routes.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../states/app_settings_state.dart';
import '../widgets/first_main_three.dart';
import '../widgets/first_main_two.dart';
import '../widgets/last_chapter_card.dart';
import '../widgets/last_main_three.dart';
import '../widgets/second_main_three.dart';
import '../widgets/second_main_two.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final bool _isOpenWithChapter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isOpenWithChapter = context.read<AppSettingsState>().getOpenWithChapters;
      if (_isOpenWithChapter) {
        _openChaptersPage();
      }
    });
  }

  void _openChaptersPage() async {
    await Future.delayed(Duration.zero);
    if (mounted) {
      await Navigator.pushNamed(context, NameRoutes.allChaptersPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            onPressed: () {
              Share.share('${AppStrings.appName}${AppStrings.appSlogan}\n\n${AppStrings.versionIOS}\n${AppStrings.linkIOS}\n\n${AppStrings.versionAndroid}\n${AppStrings.linkAndroid}');
            },
            tooltip: AppStrings.share,
            icon: Icon(
              Icons.ios_share,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: MediaQuery.removePadding(
        removeBottom: true,
        context: context,
        child: Container(
          height: screenHeight,
          padding: AppStyles.paddingMini,
          child: Material(
            borderRadius: AppStyles.borderBig,
            clipBehavior: Clip.antiAlias,
            child: OrientationLayoutBuilder(
              portrait: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 4,
                    child: FirstMainTwo(),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 4,
                    child: SecondMainTwo(),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 2,
                    child: FirstMainThree(),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 2,
                    child: SecondMainThree(),
                  ),
                  const SizedBox(height: 4),
                  LastChapterCard(),
                  const SizedBox(height: 4),
                  Expanded(
                    flex: 2,
                    child: LastMainThree(),
                  ),
                ],
              ),
              landscape: (context) => Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: FirstMainTwo(),
                        ),
                        const SizedBox(height: 4),
                        LastChapterCard(),
                        const SizedBox(height: 4),
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
                        Expanded(
                          child: FirstMainThree(),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SecondMainThree(),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
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
      ),
    );
  }
}
