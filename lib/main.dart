import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bullseye',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bullseye'),
        ),
        body: const Center(
          child: Text('Привет, Деревяшка!'),
        ),
      ),
    ),
  );
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [],
      )),
    );
  }
}
