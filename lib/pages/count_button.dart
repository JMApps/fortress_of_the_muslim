import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountButton extends StatefulWidget {
  const CountButton({Key? key, required this.buttonCount}) : super(key: key);

  final int buttonCount;

  @override
  _CountButtonState createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  late int _countNumber;

  @override
  void initState() {
    _countNumber = widget.buttonCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _countNumber = widget.buttonCount;
        });
      },
      child: FloatingActionButton(
        onPressed: () {
          if (_countNumber > 0) {
            setState(() {
              _countNumber--;
              HapticFeedback.selectionClick();
            });
          }
        },
        elevation: 3,
        mini: true,
        backgroundColor: Colors.teal,
        splashColor: Colors.teal[800],
        child: Center(
          child: Text(
            '$_countNumber',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
