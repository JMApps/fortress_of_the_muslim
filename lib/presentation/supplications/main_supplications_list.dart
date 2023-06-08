import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/main_supplication_item.dart';
import 'package:provider/provider.dart';

class MainSupplicationsList extends StatelessWidget {
  const MainSupplicationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainChaptersState>().getDatabaseQuery.getAllSupplications(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  padding: AppStyles.mainPaddingMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainSupplicationItem(
                      item: snapshot.data![index],
                      itemIndex: index,
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
