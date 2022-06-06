import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/book_content_arguments.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ContentBookContent extends StatelessWidget {
  const ContentBookContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as BookContentArguments?;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 50),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor:
              Theme.of(context).colorScheme.mainContentContentBookColor,
          title: Text(
            arguments!.title,
          ),
        ),
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SelectableHtml(
              data: arguments.content,
              style: {
                '#': Style(
                  fontSize: const FontSize(20),
                ),
                'small': Style(
                  fontSize: const FontSize(8),
                ),
                'a': Style(
                  fontSize: const FontSize(14),
                  color: Colors.blue,
                ),
              },
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                context.read<MainState>().showFootNoteDialog(
                      context,
                      url,
                      Colors.green,
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
