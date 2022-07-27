import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_settings.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/settings_app_bar.dart';

class ContentSettings extends StatelessWidget {
  const ContentSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: SettingsAppBar(),
      ),
      body: CupertinoScrollbar(
        child: ContentChapterSettings(),
      ),
    );
  }
}
