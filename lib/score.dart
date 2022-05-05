import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({Key? key, required this.totalScore, required this.round})
      : super(key: key);

  final int totalScore;
  final int round;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text('Start Over'),
        ),
        const Text('Score:'),
        const Text('9999'),
        const Text('Round:'),
        const Text('99'),
        TextButton(
          onPressed: () {},
          child: const Text('Info'),
        ),
      ],
    );
  }
}
