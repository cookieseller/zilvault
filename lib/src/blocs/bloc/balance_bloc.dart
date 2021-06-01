import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  static const String _initialBalance = "0";
  final CryptoRepository cryptoRepository;

  BalanceBloc({required this.cryptoRepository}) : super(BalanceInitial(_initialBalance));

  @override
  Stream<BalanceState> mapEventToState(
    BalanceEvent event,
  ) async* {
    if (event is BalanceUpdateRequestedEvent) {
      yield* _mapBalanceUpdateRequestedToState(event);
    }

    if (event is BalanceUpdatedEvent) {
      yield* _mapBalanceUpdatedToState(state);
    }
  }

  Stream<BalanceState> _mapBalanceUpdateRequestedToState(BalanceUpdateRequestedEvent event) async* {
    yield const BalanceUpdating();

    try {
      final balance = await this.cryptoRepository.getBalance(event.address);
      yield BalanceUpdateSuccess(balance);
    } catch (_) {
      yield BalanceUpdateFailure();
    }
  }

  Stream<BalanceState> _mapBalanceUpdatedToState(BalanceState state) async* {
    yield const BalanceUpdateSuccess("0");
  }
}
