import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:provider/provider.dart';

class ChapterContentSubTitle extends StatelessWidget {
  const ChapterContentSubTitle({Key? key, required this.chapterSubTitle})
      : super(key: key);

  final String chapterSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        top: 8,
        right: 8,
      ),
      padding: const EdgeInsets.all(8),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xFF455A64),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Html(
        data: chapterSubTitle,
        style: {
          '#': Style(
            fontSize: const FontSize(17),
            textAlign: TextAlign.center,
            color: Colors.white,
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
                const Color(0xff3f968c),
              );
        },
      ),
    );
  }
}
