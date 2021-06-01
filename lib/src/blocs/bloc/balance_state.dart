part of 'balance_bloc.dart';

@immutable
abstract class BalanceState extends Equatable {
  final String balance;

  const BalanceState(this.balance);

  const BalanceState.empty() : balance = "";

  @override
  List<Object> get props => [balance];
}

class BalanceInitial extends BalanceState {
  const BalanceInitial(String balance) : super(balance);
}

class BalanceUpdating extends BalanceState {
  const BalanceUpdating() : super.empty();
}

class BalanceUpdateSuccess extends BalanceState {
  const BalanceUpdateSuccess(String balance) : super(balance);
}

class BalanceUpdateFailure extends BalanceState {
  const BalanceUpdateFailure() : super.empty();
}
