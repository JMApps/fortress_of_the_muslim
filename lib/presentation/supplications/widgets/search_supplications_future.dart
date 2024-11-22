import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/app_settings_state.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_description.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_supplication_item.dart';

class SearchSupplicationsFuture extends StatefulWidget {
  const SearchSupplicationsFuture({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchSupplicationsFuture> createState() => _SearchSupplicationsFutureState();
}

class _SearchSupplicationsFutureState extends State<SearchSupplicationsFuture> {
  late final Future<List<SupplicationEntity>> _futureSupplications;
  List<SupplicationEntity> _supplications = [];
  List<SupplicationEntity> _recentSupplications = [];

  @override
  void initState() {
    _futureSupplications = Provider.of<MainSupplicationsState>(context, listen: false).fetchAllSupplications(languageCode: AppConstraints.appLocales[Provider.of<AppSettingsState>(context, listen: false).getAppLocaleIndex].languageCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SupplicationEntity>>(
      future: _futureSupplications,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return MainDescriptionText(
            descriptionText: appLocale.searchIsEmpty,
          );
        }
        if (snapshot.hasData) {
          _supplications = snapshot.data!;
          _recentSupplications = widget.query.isEmpty ? _supplications : _supplications.where((element) =>
          element.supplicationId.toString().contains(widget.query) ||
              (element.arabicText != null && element.arabicText!.contains(widget.query)) ||
              (element.transcriptionText != null && element.transcriptionText!.toLowerCase().contains(widget.query)) ||
              element.translationText.toLowerCase().contains(widget.query)).toList();
          return _recentSupplications.isEmpty ? MainDescriptionText(descriptionText: appLocale.searchIsEmpty) : Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingMini,
              itemCount: _recentSupplications.length,
              itemBuilder: (BuildContext context, int index) {
                return MainSupplicationItem(
                  supplicationModel: _recentSupplications[index],
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
