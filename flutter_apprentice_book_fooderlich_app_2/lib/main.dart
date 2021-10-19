import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext conxtext) {
    final theme = FooderlichTheme.light();
    //TODO: Apply Home widget

    return MaterialApp(
      title: 'Fooderlich',
      home: Home(),
      theme: theme,
    );
  }
}
