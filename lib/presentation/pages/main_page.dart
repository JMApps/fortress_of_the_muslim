import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/routes/name_routes.dart';
import '../../core/styles/app_styles.dart';
import '../../l10n/app_localizations.dart';
import '../states/app_settings_state.dart';
import '../widgets/first_main_three.dart';
import '../widgets/last_chapter_card.dart';
import '../widgets/last_main_three.dart';
import '../widgets/main_four.dart';
import '../widgets/second_main_three.dart';

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
      _isOpenWithChapter = Provider.of<AppSettingsState>(context, listen: false).getOpenWithChapters;
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
    final appLocale = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.appName),
        actions: [
          IconButton(
            onPressed: () {
              SharePlus.instance.share(
                ShareParams(text: '${appLocale.appName}${appLocale.appSlogan}\n\n${appLocale.versionIOS}\n${appLocale.linkIOS}\n\n${appLocale.versionAndroid}\n${appLocale.linkAndroid}'),
              );
            },
            tooltip: appLocale.share,
            icon: const Icon(
              Icons.ios_share,
            ),
          ),
        ],
      ),
      body: MediaQuery.removePadding(
        removeBottom: true,
        context: context,
        child: Container(
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          margin: AppStyles.paddingWithoutTopBottom,
          decoration: const BoxDecoration(borderRadius: AppStyles.borderBig),
          child: OrientationLayoutBuilder(
            portrait: (context) => const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 8,
                  child: MainFour(),
                ),
                SizedBox(height: 8),
                Expanded(
                  flex: 2,
                  child: FirstMainThree(),
                ),
                SizedBox(height: 8),
                Expanded(
                  flex: 2,
                  child: SecondMainThree(),
                ),
                SizedBox(height: 4),
                LastChapterCard(),
                SizedBox(height: 4),
                Expanded(
                  flex: 2,
                  child: LastMainThree(),
                ),
              ],
            ),
            landscape: (context) => const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: MainFour(),
                      ),
                      SizedBox(height: 4),
                      LastChapterCard(),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: FirstMainThree(),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: SecondMainThree(),
                      ),
                      SizedBox(height: 8),
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
    );
  }
}
