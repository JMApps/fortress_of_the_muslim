import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
import 'package:provider/provider.dart';

class BookContentPage extends StatelessWidget {
  const BookContentPage({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List>(
        future: context.watch<MainChaptersState>().getDatabaseQuery.getOneBookContent(index + 1),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: SingleChildScrollView(
                    padding: AppStyles.mainPadding,
                    child: ForHtmlText(
                      textData: snapshot.data![0].content,
                      textSize: 18,
                      textColor: theme.colorScheme.mainDefaultColor,
                      fontFamily: 'Gilroy',
                      footnoteColor: theme.colorScheme.mainChaptersColor,
                      textDataAlign: TextAlign.start,
                    ),
                  ),
                )
              : const Center(
                  child: Padding(
                    padding: AppStyles.mainPadding,
                    child: Text(AppStrings.errorLoadData),
                  ),
                );
        },
      ),
    );
  }
}
