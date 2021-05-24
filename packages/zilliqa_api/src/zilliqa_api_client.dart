import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/balance.dart';
import 'models/request_bodies/balance_request.dart';

class BalanceRequestFailure implements Exception {}

class ZilliqaApiClient {
  final http.Client _httpClient;

  ZilliqaApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<Balance> getAddressBalance(String address) async {
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

    final balanceJson = jsonDecode(response.body) as List;
    if (balanceJson.isEmpty) {
      throw BalanceRequestFailure();
    }

    return Balance.fromJson(balanceJson.first as Map<String, dynamic>);
  }
}
