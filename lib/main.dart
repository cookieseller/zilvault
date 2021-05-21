import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:zilvault/src/views/main_screen.dart';
import 'src/views/app_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("dev");

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
      initialRoute: '/',
      home: AppScreen(title: 'ZilVault'),
    );
  }
}
