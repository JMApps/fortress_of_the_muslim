import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/main_chapters_state.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../../widgets/main_html_data.dart';
import '../items/content_supplication_item.dart';

class ChapterContentPage extends StatelessWidget {
  const ChapterContentPage({
    super.key,
    required this.chapterId,
  });

  final int chapterId;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('${AppStrings.chapter} $chapterId'),
            floating: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    NameRoutes.settingsContentPage,
                  );
                },
                icon: Icon(Icons.settings_outlined),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: AppStyles.padding,
              padding: AppStyles.paddingMini,
              decoration: BoxDecoration(
                color: appColors.secondaryContainer,
                borderRadius: AppStyles.border,
              ),
              child: FutureBuilder<ChapterEntity>(
                future: Provider.of<MainChaptersState>(context).getChapterById(chapterId: chapterId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return MainErrorTextData(errorText: snapshot.error.toString());
                  }
                  if (snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (snapshot.hasData) {
                    final ChapterEntity chapterModel = snapshot.data!;
                    return Padding(
                      padding: AppStyles.paddingMicro,
                      child: MainHtmlData(
                        htmlData: chapterModel.chapterTitle,
                        footnoteColor: appColors.primary,
                        font: AppStrings.fontGilroy,
                        fontSize: 18.0,
                        textAlign: TextAlign.center,
                        fontColor: appColors.onSurface,
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
          ),
          FutureBuilder<List<SupplicationEntity>>(
            future: Provider.of<MainSupplicationsState>(context, listen: false).getSupplicationsByChapterId(chapterId: chapterId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: MainErrorTextData(errorText: snapshot.error.toString()),
                );
              }
              if (snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
              if (snapshot.hasData) {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    final SupplicationEntity supplicationModel = snapshot.data![index];
                    return Padding(
                      padding: AppStyles.paddingHorizontalMini,
                      child: ContentSupplicationItem(
                        supplicationModel: supplicationModel,
                        supplicationIndex: index,
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }
              return SliverFillRemaining(
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
