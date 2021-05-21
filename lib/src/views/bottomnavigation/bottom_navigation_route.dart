import 'package:flutter/material.dart';
import 'package:zilvault/src/views/bottomnavigation/transactions_view.dart';
import 'package:zilvault/src/views/bottomnavigation/receive_view.dart';
import 'package:zilvault/src/views/bottomnavigation/send_view.dart';
import 'package:zilvault/src/views/bottomnavigation/wallet_view.dart';

class BottomNavigationRoute {
  const BottomNavigationRoute(this.title, this.icon, this.color, this.view);
  final String title;
  final IconData icon;
  final MaterialColor color;
  final StatefulWidget view;
}

const List<BottomNavigationRoute> routes = <BottomNavigationRoute>[
  BottomNavigationRoute('Transactions', Icons.compare_arrows, Colors.blue, TransactionsView()),
  BottomNavigationRoute('Send', Icons.north, Colors.amber, SendView()),
  BottomNavigationRoute('Receive', Icons.south, Colors.blue, ReceiveView()),
  BottomNavigationRoute('Wallet', Icons.account_balance_wallet, Colors.blue, WalletView())
];
