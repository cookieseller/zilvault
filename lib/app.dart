import 'dart:html';

import 'package:flutter/cupertino.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key, required CryptoRepository cryptoRepository}) : super(key: key)

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: WeatherAppView(),
      ),
    );
  }
}