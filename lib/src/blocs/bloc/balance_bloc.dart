import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  static const String _initialBalance = "0";

  BalanceBloc() : super(BalanceInitial(_initialBalance));

  @override
  Stream<BalanceState> mapEventToState(
    BalanceEvent event,
  ) async* {
    if (event is BalanceUpdatieRequestedEvent) {
      yield* _mapBalanceUpdateRequestedToState(state);
    }

    if (event is BalanceUpdatedEvent) {
      yield* _mapBalanceUpdatedToState(state);
    }
  }

  Stream<BalanceState> _mapBalanceUpdateRequestedToState(BalanceState state) async* {
    yield const BalanceUpdating();
  }

  Stream<BalanceState> _mapBalanceUpdatedToState(BalanceState state) async* {
    yield const BalanceUpdateSuccess("0");
  }
}
