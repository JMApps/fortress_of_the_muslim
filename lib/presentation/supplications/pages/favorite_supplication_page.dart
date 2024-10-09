import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../lists/favorite_supplications_list.dart';

class FavoriteSupplicationPage extends StatelessWidget {
  const FavoriteSupplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.favoriteSupplications),
      ),
      body: const FavoriteSupplicationsList(),
    );
  }
}
