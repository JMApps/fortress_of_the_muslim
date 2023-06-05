import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/main_chapters_list.dart';
import 'package:provider/provider.dart';

class MainChaptersPage extends StatelessWidget {
  const MainChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.chapters),
        ),
        body: const MainChaptersList(),
      ),
    );
  }
}
