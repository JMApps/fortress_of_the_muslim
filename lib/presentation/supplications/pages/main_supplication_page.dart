import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../widgets/fab_to_start.dart';
import '../../states/scroll_page_state.dart';
import '../lists/main_supplications_list.dart';
import '../widgets/search_supplications_delegate.dart';

class MainSupplicationPage extends StatefulWidget {
  const MainSupplicationPage({super.key});

  @override
  State<MainSupplicationPage> createState() => _MainSupplicationPageState();
}

class _MainSupplicationPageState extends State<MainSupplicationPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScrollPageState>(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.allSupplications),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchSupplicationsDelegate());
              },
              tooltip: AppStrings.search,
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const MainSupplicationsList(),
        floatingActionButton: FabTopStart(
          fabColor: Colors.red.withOpacity(0.35),
        ),
      ),
    );
  }
}
