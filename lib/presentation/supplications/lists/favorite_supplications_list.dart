import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/app_settings_state.dart';
import '../../states/main_supplications_state.dart';
import '../../states/scroll_page_state.dart';
import '../../widgets/favorite_is_empty.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/favorite_supplication_item.dart';

class FavoriteSupplicationsList extends StatelessWidget {
  const FavoriteSupplicationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
    return FutureBuilder<List<SupplicationEntity>>(
      future: Provider.of<MainSupplicationsState>(context, listen: false).getFavoriteSupplications(languageCode: AppConstraints.appLocales[Provider.of<AppSettingsState>(context, listen: false).getAppLocaleIndex].languageCode, ids: Provider.of<MainSupplicationsState>(context).getFavoriteSupplicationIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return FavoriteIsEmpty(
            text: appLocale.favoriteSupplicationsIsEmpty,
            color: Colors.blue,
          );
        }
        return Scrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            padding: AppStyles.paddingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final supplicationModel = snapshot.data![index];
              return FavoriteSupplicationItem(
                supplicationModel: supplicationModel,
                supplicationIndex: index + 1,
                supplicationLength: snapshot.data!.length,
              );
            },
          ),
        );
      },
    );
  }
}
