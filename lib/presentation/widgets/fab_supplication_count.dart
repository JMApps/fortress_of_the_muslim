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
        return AnimatedSize(
          duration: const Duration(milliseconds: 750),
          child: Visibility(
            visible: counter.getCounterButtonIsShow,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: FloatingActionButton.large(
                onPressed: () {
                  counter.decrement;
                },
                backgroundColor: buttonColor,
                elevation: 0,
                child: Center(
                  child: Text(
                    '${counter.getCount}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
