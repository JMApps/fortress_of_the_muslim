import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';
import 'package:html/parser.dart';

class TakeScreenShot extends StatelessWidget {
  const TakeScreenShot({
    Key? key,
    required this.item,
    required this.index,
    required this.supplicationLength,
    required this.chapterTitle,
  }) : super(key: key);

  final SupplicationModelItem item;
  final int index;
  final int supplicationLength;
  final String chapterTitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Wrap(
        children: [
          ListView(
            controller: ScrollController(),
            shrinkWrap: true,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[50],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _parseHtmlString(chapterTitle),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      item.contentArabic != null
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                item.contentArabic!,
                                style: TextStyle(
                                  fontSize: 23,
                                  fontFamily: 'Hafs',
                                  color: Colors.blueGrey[800],
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            )
                          : SizedBox(),
                      item.contentArabic != null
                          ? SizedBox(height: 16)
                          : SizedBox(),
                      Text(
                        item.contentForCopyAndShare!,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  indent: 16,
                                  endIndent: 16,
                                  color: Colors.black)),
                          SizedBox(width: 8),
                          Text(
                            '${index + 1}/$supplicationLength',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Gilroy',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/asgp.png',
                            width: 70,
                            height: 40,
                          ),
                          SizedBox(width: 16),
                          Image.asset(
                            'assets/images/splash_launch.png',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Крепость верующего\nКрепость мусульманина',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Gilroy',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final documentText = parse(htmlString);
    final String parsedString = parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
