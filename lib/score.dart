import 'dart:ffi';

import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score(
      {Key? key,
      required this.totalScore,
      required this.round,
      required this.onStartOver})
      : super(key: key);

  final int totalScore;
  final int round;
  final VoidCallback onStartOver;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          child: const Text('Начать заново'),
          onPressed: () {
            onStartOver();
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Text('Рекорд:'),
              Text('$totalScore'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Text('Раунд:'),
              Text('$round'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Инфо'),
        ),
      ],
    );
  }
}
