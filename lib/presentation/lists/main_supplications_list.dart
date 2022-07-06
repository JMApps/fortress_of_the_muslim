import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_supplication_Item.dart';

class MainSupplicationsList extends StatelessWidget {
  const MainSupplicationsList({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return snapshot.hasData
        ? CupertinoScrollbar(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return MainSupplicationItem(
                  item: snapshot.data![index],
                );
              },
            ),
          )
        : const Center(
            child: CircularProgressIndicator.adaptive(),
          );
  }
}
