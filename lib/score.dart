import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        EdgeInsets,
        Icons,
        Key,
        MainAxisAlignment,
        Padding,
        Row,
        StatelessWidget,
        Text,
        TextButton,
        VoidCallback,
        Widget;
import 'text_styles.dart';
import 'styled_button.dart';

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
        StyledButton(
          icon: Icons.refresh,
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children: <Widget>[
              Text(
                'Рекорд:',
                style: LabelTextStyle.bodyText1(context),
              ),
              Text(
                '$totalScore',
                style: ScoreNumberTextStyle.headline4(context),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children: <Widget>[
              Text(
                'Раунд:',
                style: LabelTextStyle.bodyText1(context),
              ),
              Text(
                '$round',
                style: ScoreNumberTextStyle.headline4(context),
              ),
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
