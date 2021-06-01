import 'package:flutter/material.dart';
import 'src/views/app_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZilVault',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AppScreen(title: 'ZilVault'),
    );
  }
}
