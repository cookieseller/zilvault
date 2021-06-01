part of 'balance_bloc.dart';

@immutable
abstract class BalanceEvent extends Equatable {
  const BalanceEvent();

  @override
  List<Object> get props => [];
}

class BalanceUpdatieRequestedEvent extends BalanceEvent {}

class BalanceUpdatingEvent extends BalanceEvent {}

class BalanceUpdatedEvent extends BalanceEvent {
  final String balance;

  const BalanceUpdatedEvent({required this.balance});

  @override
  List<Object> get props => [balance];
}

class BalanceUpdateFailedEvent extends BalanceEvent {}
