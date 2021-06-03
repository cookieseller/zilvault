import 'dart:convert';
import 'package:blockchain_interface/blockchain_interface.dart';
import 'package:decimal/decimal.dart';
import 'package:http/http.dart' as http;
import 'models/balance.dart';
import 'models/request_bodies/balance_request.dart';

class BalanceRequestFailure implements Exception {}

class ZilliqaApiClient implements BlockchainInterface {
  final http.Client _httpClient;

  ZilliqaApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<String> getAddressBalance(String address) async {
    BalanceRequestBody body = BalanceRequestBody.defaultBody();
    body.address.add(address);

    final response = await _httpClient.post(Uri.https('api.zilliqa.com', ''),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));

    if (response.statusCode != 200) {
      throw BalanceRequestFailure();
    }



    final Map<String, dynamic> result = jsonDecode(response.body)['result'];

    final balance = Decimal.parse(result['balance']) * Decimal.parse('10').pow(12 * -1);

    return balance.toString();
  }
}
