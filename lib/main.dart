import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Shuffle());
}

class Shuffle extends StatefulWidget {
  const Shuffle({Key key}) : super(key: key);

  @override
  _ShuffleState createState() => _ShuffleState();
}

class _ShuffleState extends State<Shuffle> {
  int picNum = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('SHUFFLE')),
          backgroundColor: Colors.purple[400],
        ),
        body: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/image$picNum.jpg',
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.repeat),
                  iconSize: 35.0,
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 35.0,
                  onPressed: () {
                    setState(() {
                      picNum -= 1;
                      if (picNum == 0) {
                        picNum = 1;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 50.0,
                  onPressed: () {
                    setState(() {
                      picNum = Random().nextInt(3) + 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 35.0,
                  onPressed: () {
                    setState(() {
                      picNum += 1;
                      if (picNum == 4) {
                        picNum = 1;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shuffle),
                  iconSize: 35.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
