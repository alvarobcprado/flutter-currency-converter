import 'package:flutter/material.dart';

import 'loadingContainer.dart';

class PlaceHolderRow extends StatelessWidget {
  const PlaceHolderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: LoadingContainer(),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 6,
          child: LoadingContainer(),
        ),
      ],
    );
  }
}
