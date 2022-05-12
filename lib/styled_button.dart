import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
    );
  }
}
