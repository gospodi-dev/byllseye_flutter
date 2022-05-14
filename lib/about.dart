import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О игре "Точно в цель"'),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            '☭ Точно в Цель ☭',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
          const Text(
            'Это Точно в Цель, игра, в которой вы можете выиграть очки и обрести славу перемещая ползунок удачи.\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          const Text(
            'Ваша цель - поместить ползунок как можно ближе к целевому значению. Чем ближе вы находитесь, тем больше очков набираете.\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          const Text(
            'Удачи!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ],
      )),
    );
  }
}
