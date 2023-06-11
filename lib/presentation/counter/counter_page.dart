import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/counter_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/presentation/counter/counter_column.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.counter),
        ),
        body: const CounterColumn(),
      ),
    );
  }
}
