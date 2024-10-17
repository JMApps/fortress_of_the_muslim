import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/content_settings_state.dart';

class CounterAlignDropDown extends StatelessWidget {
  const CounterAlignDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppStrings.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    Widget buildDropDownRow({
      required String label,
      required int selectedIndex,
      required ValueChanged<int?> onChanged,
    }) {
      return Row(
        children: [
          Text(
            label,
            style: AppStyles.mainTextStyle17,
          ),
          const Spacer(),
          DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            padding: AppStyles.paddingHorizontal,
            borderRadius: AppStyles.border,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: selectedIndex,
            items: List.generate(
              AppStrings.counterAligns.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(AppStrings.counterAligns[index],
                      style: selectedIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle17,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: onChanged,
            underline: Container(),
          ),
        ],
      );
    }

    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                AppStrings.counterAlign,
                style: AppStyles.mainTextStyle17Bold,
              ),
              leading: Icon(
                Icons.align_horizontal_left_rounded,
                color: appColors.primary,
              ),
            ),
            buildDropDownRow(
              label: AppStrings.align,
              selectedIndex: contentSettings.getCounterAlignIndex,
              onChanged: (newIndex) => contentSettings.setCounterAlignIndex = newIndex!,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
