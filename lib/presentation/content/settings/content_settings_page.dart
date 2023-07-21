import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class ContentSettingsPage extends StatelessWidget {
  const ContentSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          padding: AppStyles.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Расположение текста'),
              const SizedBox(height: 16),
              CupertinoSlidingSegmentedControl(
                padding: const EdgeInsets.all(4),
                children: const <int, Widget>{
                  0: Icon(CupertinoIcons.text_alignleft),
                  1: Icon(CupertinoIcons.text_aligncenter),
                  2: Icon(CupertinoIcons.text_alignright),
                },
                thumbColor: Colors.teal.shade50,
                groupValue: 0,
                onValueChanged: (int? index) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
