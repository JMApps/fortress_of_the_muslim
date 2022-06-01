import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:provider/provider.dart';

class ShareCopyPopup extends StatelessWidget {
  const ShareCopyPopup({
    Key? key,
    required this.contentForShareAndCopy,
    required this.color,
  }) : super(key: key);

  final String contentForShareAndCopy;
  final Color color;

  @override
  Widget build(BuildContext context) {
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
                      context.read<MainState>().showSnackBarMessage(
                          context, color, 'Скопировано');
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
}
