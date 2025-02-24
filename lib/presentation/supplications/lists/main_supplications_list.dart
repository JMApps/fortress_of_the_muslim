import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/main_supplications_state.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_supplication_item.dart';

class MainSupplicationsList extends StatefulWidget {
  const MainSupplicationsList({
    super.key,
    required this.tableName,
  });

  final String tableName;

  @override
  State<MainSupplicationsList> createState() => _MainSupplicationsListState();
}

class _MainSupplicationsListState extends State<MainSupplicationsList> {
  late final ScrollController _scrollController;
  late final Future<List<SupplicationEntity>> _futureSupplications;

  @override
  void initState() {
    _scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
    _futureSupplications = Provider.of<MainSupplicationsState>(context, listen: false).fetchAllSupplications(tableName: widget.tableName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SupplicationEntity>>(
      future: _futureSupplications,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              padding: AppStyles.paddingWithoutTopMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final supplicationModel = snapshot.data![index];
                return MainSupplicationItem(
                  supplicationModel: supplicationModel,
                  supplicationIndex: index + 1,
                  supplicationLength: snapshot.data!.length,
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
