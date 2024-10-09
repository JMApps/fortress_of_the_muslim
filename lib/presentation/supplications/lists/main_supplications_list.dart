import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_supplication_item.dart';

class MainSupplicationsList extends StatefulWidget {
  const MainSupplicationsList({super.key});

  @override
  State<MainSupplicationsList> createState() => _MainSupplicationsListState();
}

class _MainSupplicationsListState extends State<MainSupplicationsList> {
  late Future<List<SupplicationEntity>> _futureSupplications;

  @override
  void initState() {
    _futureSupplications = Provider.of<MainSupplicationsState>(context, listen: false).getAllSupplications();
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
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasData) {
          return Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final supplicationModel = snapshot.data![index];
                return MainSupplicationItem(
                  supplicationModel: supplicationModel,
                  supplicationIndex: index,
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
