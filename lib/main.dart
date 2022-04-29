// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Привет, Деревяшка!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            TextButton(
              onPressed: newMethod,
              child: const Text('Вдарь мне!',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  void newMethod() {
    print('object!!!');
  }
}
