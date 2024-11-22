import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/app_player_state.dart';
import '../../states/app_settings_state.dart';
import '../../states/main_chapters_state.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../../widgets/main_html_data.dart';
import '../items/content_supplication_item.dart';

class ChapterContentPage extends StatefulWidget {
  const ChapterContentPage({
    super.key,
    required this.chapterId,
  });

  final int chapterId;

  @override
  State<ChapterContentPage> createState() => _ChapterContentPageState();
}

class _ChapterContentPageState extends State<ChapterContentPage> {
  late final Future<ChapterEntity> _futureChapter;
  late final Future<List<SupplicationEntity>> _futureSupplications;

  @override
  void initState() {
    super.initState();
    _futureChapter = Provider.of<MainChaptersState>(context, listen: false).getChapterById(languageCode: AppConstraints.appLocales[Provider.of<AppSettingsState>(context, listen: false).getAppLocaleIndex].languageCode, chapterId: widget.chapterId);
    _futureSupplications = Provider.of<MainSupplicationsState>(context, listen: false).getSupplicationsByChapterId(languageCode: AppConstraints.appLocales[Provider.of<AppSettingsState>(context, listen: false).getAppLocaleIndex].languageCode, chapterId: widget.chapterId);
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('${appLocale.chapter} ${widget.chapterId}'),
            floating: true,
            leading: IconButton(
              onPressed: () {
                Provider.of<AppPlayerState>(context, listen: false).stopTrack();
                Navigator.of(context).pop();
              },
              tooltip: appLocale.back,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            actions: [
              IconButton.filledTonal(
                onPressed: () async {
                  await Navigator.pushNamed(
                    context,
                    NameRoutes.settingsContentPage,
                  );
                },
                tooltip: appLocale.settings,
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: AppStyles.paddingMini,
              padding: AppStyles.paddingMini,
              decoration: BoxDecoration(
                color: appColors.secondaryContainer,
                borderRadius: AppStyles.border,
              ),
              child: FutureBuilder<ChapterEntity>(
                future: _futureChapter,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return MainErrorTextData(errorText: snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    final ChapterEntity chapterModel = snapshot.data!;
                    return Padding(
                      padding: AppStyles.paddingMicro,
                      child: MainHtmlData(
                        htmlData: chapterModel.chapterTitle,
                        footnoteColor: appColors.primary,
                        font: AppConstraints.fontRaleway,
                        fontSize: 17.0,
                        textAlign: TextAlign.center,
                        fontColor: appColors.onSurface,
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
          ),
          FutureBuilder<List<SupplicationEntity>>(
            future: _futureSupplications,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.hasError) {
                  return SliverFillRemaining(
                    child: MainErrorTextData(errorText: snapshot.error.toString()),
                  );
                }
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    final SupplicationEntity supplicationModel = snapshot.data![index];
                    return Padding(
                      padding: AppStyles.paddingHorizontalMini,
                      child: ContentSupplicationItem(
                        supplicationModel: supplicationModel,
                        supplicationIndex: index + 1,
                        supplicationLength: snapshot.data!.length,
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
