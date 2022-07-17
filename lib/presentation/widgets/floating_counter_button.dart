import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FloatingCounterButton extends StatelessWidget {
  const FloatingCounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DraggableFab(
        child: FloatingActionButton(
          mini: false,
          backgroundColor: Theme.of(context).colorScheme.chapterContentColor,
          splashColor: Colors.blueGrey[700],
          child: CircularPercentIndicator(
            animationDuration: 0,
            radius: 25,
            lineWidth: 2,
            animation: true,
            percent: context.watch<MainState>().getSupplicationCount / 100,
            center: Text(
              context.watch<MainState>().getSupplicationCount.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple[400],
          ),
          onPressed: () {
            context.read<MainState>().updateCountValue();
            HapticFeedback.lightImpact();
          },
        ),
      ),
      onLongPress: () {
        context.read<MainState>().resetCount();
      },
    );
  }
}
