import 'package:decimal/decimal.dart';

class AccountModel {
  final String balance;
  final int nonce;

  AccountModel({required this.balance, required this.nonce});

  String getBalance() {
    return balance;
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> result = json['result'];

    final balance = Decimal.parse(result['balance']) * Decimal.parse('10').pow(12 * -1);
    return AccountModel(
      balance: balance.toString(),
      nonce: (result['nonce'] is int) ? result['nonce'] : int.parse(result['nonce']),
    );
  }
}
