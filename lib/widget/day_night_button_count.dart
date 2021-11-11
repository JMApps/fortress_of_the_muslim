import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DayNightButtonCount extends StatefulWidget {
  const DayNightButtonCount({Key? key, required this.buttonCount})
      : super(key: key);

  final int buttonCount;

  @override
  _DayNightButtonCountState createState() => _DayNightButtonCountState();
}

class _DayNightButtonCountState extends State<DayNightButtonCount> {
  late int _countNumber;

  @override
  void initState() {
    _countNumber = widget.buttonCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: InkWell(
        onLongPress: () {
          setState(() {
            _countNumber = widget.buttonCount;
          });
        },
        child: Material(
          color: Colors.blueGrey,
          elevation: 3,
          child: InkWell(
            splashColor: Colors.blueGrey[900], // Splash color
            onTap: () {
              if (_countNumber > 0) {
                setState(() {
                  _countNumber--;
                  if (_countNumber == 0) {
                    HapticFeedback.vibrate();
                 } else {
                   HapticFeedback.lightImpact();
                 }
                });
              }
            },
            child: SizedBox(
              width: 35,
              height: 35,
              child: Center(
                child: Text(
                  '$_countNumber',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
