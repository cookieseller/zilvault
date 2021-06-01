import 'package:flutter/material.dart';
import 'package:zilvault/src/utils/address_converter.dart';
import 'package:zilvault/zilliqa/account.dart';
import 'package:zilvault/zilliqa/account_model.dart';

class WalletView extends StatefulWidget {
  const WalletView() : super();

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  late TextEditingController _textController;
  String myData = '';
  late Future<AccountModel> futureAccount;

  @override
  void initState() {
    super.initState();

    futureAccount = Account().fetchAccount();
    _textController = TextEditingController(
      text: 'sample text: Wallet',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          FutureBuilder<AccountModel>(
              future: futureAccount,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.balance);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              }),
          TextField(
            controller: _textController,
            onChanged: (text) {
              setState(() {
                myData = "";
                final addr = AddressConverter().addr(text);
                if (addr != null) {
                  final account = Account().fetchAccount();
                }
              });
            },
          ),
          Text(myData),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
