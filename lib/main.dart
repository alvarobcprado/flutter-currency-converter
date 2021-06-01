import 'package:flutter/material.dart';

import 'app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Currency converter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.white,
          cursorColor: Colors.white,
        ),
      ),
      home: HomeView(),
    );
  }
}
