import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/book_content_entity.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../../widgets/main_html_data.dart';

class BookContentDetailPage extends StatelessWidget {
  const BookContentDetailPage({
    super.key,
    required this.bookModel,
  });

  final BookContentEntity bookModel;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(bookModel.bookContentTitle),
        ),
        body: Consumer<ScrollPageState>(
          builder: (context, scrollPageState, _) {
            return Scrollbar(
              controller: scrollPageState.getScrollController,
              child: SingleChildScrollView(
                controller: scrollPageState.getScrollController,
                padding: AppStyles.padding,
                child: MainHtmlData(
                  htmlData: bookModel.bookContent,
                  footnoteColor: Colors.orange,
                  font: appLocale.mainFont,
                  fontSize: 18.0,
                  textAlign: TextAlign.start,
                  fontColor: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            );
          },
        ),
        floatingActionButton: FabTopStart(
          fabColor: Colors.orange.withOpacity(0.35),
        ),
      ),
    );
  }
}
