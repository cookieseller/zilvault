import 'package:decimal/decimal.dart';
import 'package:global_configuration/global_configuration.dart';

class AccountModel {
  final String balance;
  final int nonce;

  AccountModel({this.balance, this.nonce});

  String getBalance() {
    return balance;
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> result = json['result'];

    final decimalPlaces = GlobalConfiguration().getValue("decimal_places");
    final balance = Decimal.parse(result['balance']) * Decimal.parse('10').pow(decimalPlaces * -1);
    return AccountModel(
      balance: balance.toString(),
      nonce: (result['nonce'] is int) ? result['nonce'] : int.parse(result['nonce']),
    );
  }
}
