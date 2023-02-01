import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
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
              CustomButton(number: 1, color: 0xffEF5350),
              CustomButton(number: 2, color: 0xffFB8C00),
              CustomButton(number: 3, color: 0xffFFD54F),
              CustomButton(number: 4, color: 0xff388E3C),
              CustomButton(number: 5, color: 0xff1B5E20),
              CustomButton(number: 6, color: 0xff0277BD),
              CustomButton(number: 7, color: 0xff673AB7)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final int number;
  final int color;
  const CustomButton({super.key, required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: (() {
          final player = AudioPlayer();
          player.play(AssetSource('note$number.wav'));
        }),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(color),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: const Text(''),
      ),
    );
  }
}
