import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPlayer extends StatefulWidget {
  MyPlayer({Key? key}) : super(key: key);

  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '00:54',
            style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 16,
                fontFamily: 'Gilroy'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.skip_previous_outlined),
            splashColor: Colors.blueGrey,
            color: Colors.blueGrey[800],
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.play_circle),
            splashColor: Colors.blueGrey,
            color: Colors.blueGrey[800],
            iconSize: 50,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.skip_next_outlined),
            splashColor: Colors.blueGrey,
            color: Colors.blueGrey[800],
            iconSize: 30,
          ),
          Text(
            '14:54',
            style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 16,
                fontFamily: 'Gilroy'),
          ),
        ],
      ),
    );
  }
}
