import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('Shake the Dice'),
          backgroundColor: Colors.blueAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var lst = [1, 2, 3, 4, 5, 6];
  var ran = new Random();
  int leftDiceNumber = 1;
  int rigthDiceNumber = 1;

  void diceRoll() {
    leftDiceNumber = lst[ran.nextInt(lst.length)];
    rigthDiceNumber = lst[ran.nextInt(lst.length)];
  }

  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        diceRoll();
        vibrate();
      });
    });
  }

  Future<void> vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 250);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  diceRoll();
                  vibrate();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  diceRoll();
                  vibrate();
                });
              },
              child: Image.asset('images/dice$rigthDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
