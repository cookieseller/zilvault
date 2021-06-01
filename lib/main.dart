import 'package:crypto_repository/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'app.dart';

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
      home: CryptoApp(cryptoRepository: CryptoRepository()),
    );
  }
}
