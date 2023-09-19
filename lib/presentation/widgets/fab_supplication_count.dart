import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/content_counter_state.dart';
import 'package:provider/provider.dart';

class FabSupplicationCount extends StatelessWidget {
  const FabSupplicationCount({
    super.key,
    required this.buttonColor,
  });

  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentCounterState>(
      builder: (context, counter, _) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: InkWell(
            onTap: () {
              counter.decrement;
            },
            onLongPress: () {
              counter.getDefaultCount;
            },
            borderRadius: BorderRadius.circular(150),
            child: CircleAvatar(
              backgroundColor: buttonColor,
              radius: 40,
              child: Center(
                child: Text(
                  '${counter.getCount}',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Ubuntu'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
