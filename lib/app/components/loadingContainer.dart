import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withAlpha(100),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
