import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'DicePage.dart';
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

