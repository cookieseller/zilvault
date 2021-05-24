import 'package:decimal/decimal.dart';

class Balance {
  final String balance;

  const Balance({required this.balance});

  factory Balance.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> result = json['result'];

    final balance = Decimal.parse(result['balance']) * Decimal.parse('10').pow(-12);
    return Balance(
      balance: balance.toString(),
    );
  }
}
