import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/supplications_bottom_buttons.dart';
import 'package:provider/provider.dart';

class MainSupplicationItem extends StatelessWidget {
  const MainSupplicationItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MainSupplicationItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: item.id.isOdd ? myColor.secondIs0dd : myColor.firstIs0dd,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Visibility(
              visible: true,
              maintainAnimation: false,
              maintainSize: false,
              child: item.contentArabic != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${item.contentArabic}',
                          style:
                              const TextStyle(fontSize: 20, fontFamily: 'Hafs'),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Visibility(
              visible: true,
              maintainAnimation: false,
              maintainSize: false,
              child: item.contentTranscription != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${item.contentTranscription}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Html(
              data: item.contentTranslation,
              style: {
                '#': Style(
                  fontSize: const FontSize(17),
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
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
                    context, url, myColor.supplicationColor);
              },
            ),
            const SizedBox(height: 8),
            const Divider(color: Colors.black),
            const SizedBox(height: 8),
            SupplicationsBottomButtons(item: item),
          ],
        ),
      ),
    );
  }
}
