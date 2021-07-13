import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String name;
  final Function onPressed;

  const ButtonWidget({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
      child: Text(name),
    );
  }
}
