import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/favorite_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FavoriteSupplicationsShareCopyPopup extends StatelessWidget {
  const FavoriteSupplicationsShareCopyPopup({
    Key? key,
    required this.item,
    required this.color,
  }) : super(key: key);

  final FavoriteSupplicationItemModel item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(16),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: const Center(
                      child: Text(
                        'Поделиться',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Share.share(
                        _contentForCopyAndShare(),
                        sharePositionOrigin:
                            Rect.fromLTWH(0, 0, size.width, size.height / 2),
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: const Center(
                      child: Text(
                        'Скопировать',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onPressed: () {
                      FlutterClipboard.copy(_contentForCopyAndShare());
                      context
                          .read<MainState>()
                          .showSnackBarMessage(context, color, 'Скопировано');
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  String _contentForCopyAndShare() {
    return '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
        '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
        '${item.contentForCopyAndShare}';
  }
}
