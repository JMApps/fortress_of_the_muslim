import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/data/model/footnote_model.dart';
import 'package:provider/provider.dart';

class FootnotePage extends StatelessWidget {
  const FootnotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.footnotes),
      ),
      body: FutureBuilder<List>(
        future: context.watch<MainChaptersState>().getDatabaseQuery.getAllFootnotes(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final FootnoteModel item = snapshot.data![index];
                      return Card(
                        child: Padding(
                          padding: AppStyles.mainPaddingMini,
                          child: Text(
                            item.footnote,
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
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
