import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/book_content_entity.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../../widgets/main_html_data.dart';

class BookContentDetailPage extends StatefulWidget {
  const BookContentDetailPage({
    super.key,
    required this.bookModel,
  });

  final BookContentEntity bookModel;

  @override
  State<BookContentDetailPage> createState() => _BookContentDetailPageState();
}

class _BookContentDetailPageState extends State<BookContentDetailPage> {
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
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.bookModel.bookContentTitle),
        ),
        body: Consumer<ScrollPageState>(
          builder: (context, scrollPageState, _) {
            return Scrollbar(
              controller: scrollPageState.getScrollController,
              child: SingleChildScrollView(
                controller: scrollPageState.getScrollController,
                padding: AppStyles.paddingWithoutTopMini,
                child: MainHtmlData(
                  htmlData: widget.bookModel.bookContent,
                  footnoteColor: Colors.orange,
                  font: AppConstraints.fontGilroy,
                  fontSize: 18.0,
                  textAlign: TextAlign.start,
                  fontColor: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            );
          },
        ),
        floatingActionButton: FabTopStart(fabColor: Colors.orange.withOpacity(0.35)),
      ),
    );
  }
}
