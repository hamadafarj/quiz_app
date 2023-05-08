import 'package:flutter/material.dart';

import 'modules/home_screen/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QuizApp',
      home: HomePage(),
    );
  }
}

