import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/favorite_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/favorite_supplications_bottom_buttons.dart';
import 'package:provider/provider.dart';

class FavoriteSupplicationItem extends StatelessWidget {
  const FavoriteSupplicationItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FavoriteSupplicationItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      color: item.id.isOdd ? Colors.white : Colors.grey[200],
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
                  color: const Color(0xff454c5b),
                ),
              },
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                context.read<MainState>().showFootNoteDialog(
                      context,
                      url,
                  const Color(0xff454c5b),
                    );
              },
            ),
            const SizedBox(height: 8),
            const Divider(color: Colors.black),
            const SizedBox(height: 8),
            FavoriteSupplicationsBottomButtons(item: item),
          ],
        ),
      ),
    );
  }
}