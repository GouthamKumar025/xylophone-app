import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$soundNumber.wav'),
    );
  }

  Expanded buildXylo({required Color color, required int sound_num}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          playSound(sound_num);
        },
        child: SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildXylo(color: Colors.red, sound_num: 1),
                buildXylo(color: Colors.orange, sound_num: 2),
                buildXylo(color: Colors.yellow, sound_num: 3),
                buildXylo(color: Colors.green, sound_num: 4),
                buildXylo(color: Colors.lightBlueAccent, sound_num: 5),
                buildXylo(color: Colors.blue, sound_num: 6),
                buildXylo(color: Colors.purpleAccent, sound_num: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
