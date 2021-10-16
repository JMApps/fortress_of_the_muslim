import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPlayer extends StatefulWidget {
  const MainPlayer({Key? key}) : super(key: key);

  @override
  _MainPlayerState createState() => _MainPlayerState();
}

class _MainPlayerState extends State<MainPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('--:--', style: TextStyle(color: Colors.white),),
              IconButton(icon: Icon(CupertinoIcons.backward_end, color: Colors.white,), onPressed: () {},),
              IconButton(icon: Icon(CupertinoIcons.play), iconSize: 30, color: Colors.white, onPressed: () {},),
              IconButton(icon: Icon(CupertinoIcons.forward_end, color: Colors.white,), onPressed: () {},),
              IconButton(icon: Icon(CupertinoIcons.arrow_2_circlepath, color: Colors.white,), onPressed: () {},),
              IconButton(icon: Icon(CupertinoIcons.arrow_turn_right_down, color: Colors.white,), onPressed: () {},),
              Text('01:33', style: TextStyle(color: Colors.white),),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}