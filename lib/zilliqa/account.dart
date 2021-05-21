import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zilvault/zilliqa/requests/balance_body.dart';
import 'account_model.dart';

class Account {
  Future<AccountModel> fetchAccount() async {
    BalanceBody body = BalanceBody.defaultBody();
    body.address.add('AB70efe340afCb01E5164e020C6E6c49ec4dD63C');

    final response = await http.post(Uri.https('api.zilliqa.com', ''),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      return AccountModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch account data');
    }
  }
}
