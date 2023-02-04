import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Xylophone Udemy',
        home: Xylophone());
  }
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomButton(soundNumber: 1, color: 0xffEF5350),
              CustomButton(soundNumber: 2, color: 0xffFB8C00),
              CustomButton(soundNumber: 3, color: 0xffFFD54F),
              CustomButton(soundNumber: 4, color: 0xff388E3C),
              CustomButton(soundNumber: 5, color: 0xff1B5E20),
              CustomButton(soundNumber: 6, color: 0xff0277BD),
              CustomButton(soundNumber: 7, color: 0xff673AB7)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final int color;
  final int soundNumber;
  const CustomButton(
      {super.key, required this.color, required this.soundNumber});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: (() {
          playSound(soundNumber);
        }),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(color),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: Text(
          '$soundNumber',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
