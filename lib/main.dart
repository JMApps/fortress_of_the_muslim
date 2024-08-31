import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/states/footnotes_state.dart';
import 'data/states/main_chapters_state.dart';
import 'presentation/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(),
        ),
        ChangeNotifierProvider(
          create: (_) => FootnotesState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
