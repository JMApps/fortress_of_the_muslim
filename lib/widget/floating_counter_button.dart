import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/floating_counter_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FloatingCounterButton extends StatelessWidget {
  const FloatingCounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        splashColor: Colors.blueGrey[700],
        child: CircularPercentIndicator(
          animationDuration: 0,
          radius: 55,
          lineWidth: 2,
          animation: true,
          percent: context.watch<FloatingCounterState>().getCount / 100,
          center: Text(
            context.watch<FloatingCounterState>().getCount.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.blueGrey[900],
        ),
        onPressed: () {
          context.read<FloatingCounterState>().updateCountValue();
        },
      ),
      onLongPress: () {
        context.read<FloatingCounterState>().setCount();
      },
    );
  }
}