import 'package:flutter/material.dart'
    show
        AlertDialog,
        AssetImage,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Center,
        Colors,
        Column,
        Container,
        DecorationImage,
        Key,
        MainAxisAlignment,
        MaterialApp,
        Navigator,
        Scaffold,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextButton,
        TextStyle,
        Widget,
        runApp,
        showDialog;
import 'package:flutter/services.dart';
import 'dart:math';
import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';
import 'hit_me_button.dart';

void main() {
  runApp(const BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(_newTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Prompt(
                targetValue: _model.target,
              ),
              Control(model: _model),
              HitMeButton(
                  text: 'Вдарь мне!',
                  onPressed: () {
                    _showAlert(context);
                  }),
              Score(
                totalScore: _model.totalScore,
                round: _model.round,
                onStartOver: _startNewGame,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _pointForCurrentRound() {
    var bonus = 0;
    const maximumScore = 100;
    var difference = _differenceAmount();
    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }
    return maximumScore - difference + bonus;
  }

  String _alertTitle() {
    var difference = _differenceAmount();
    String title;
    if (difference == 0) {
      title = 'Великолепно!';
    } else if (difference < 5) {
      title = 'Ты почти угадал!';
    } else if (difference < 10) {
      title = 'Не плохо.';
    } else {
      title = 'Может попробуешь ещё?';
    }
    return title;
  }

  int _differenceAmount() => (_model.target - _model.current).abs();

  int _newTargetValue() => Random().nextInt(100) + 1;

  void _startNewGame() {
    setState(() {
      _model.totalScore = GameModel.scoreStart;
      _model.round = GameModel.roundStart;
      _model.current = GameModel.sliderStart;
      _model.target = _newTargetValue();
    });
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        setState(() {
          _model.totalScore += _pointForCurrentRound();
          _model.target = _newTargetValue();
          _model.round += 1;
        });
      },
      child: const Text('Awesome!'),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_alertTitle()),
          content: Text('The slder\'s value is ${_model.current}.\n'
              'You scored ${_pointForCurrentRound()} points this round.'),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
