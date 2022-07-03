import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ContentBookContent extends StatelessWidget {
  const ContentBookContent({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 50),
        child: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.mainContentContentBookItemColor,
          title: Text(
            title,
          ),
        ),
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SelectableHtml(
              data: content,
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
                      Theme.of(context)
                          .colorScheme
                          .mainContentContentBookItemColor,
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
