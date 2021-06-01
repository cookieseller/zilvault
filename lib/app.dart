import 'package:crypto_repository/crypto_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zilvault/src/blocs/bloc/balance_bloc.dart';
import 'package:zilvault/src/views/balance_page.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key, required CryptoRepository cryptoRepository}) : _cryptoRepository = cryptoRepository, super(key: key);

  final CryptoRepository _cryptoRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _cryptoRepository,
      child: BlocProvider(
        create: (_) => BalanceBloc(cryptoRepository: _cryptoRepository),
        child: BalancePage(),
      ),
    );
  }
}