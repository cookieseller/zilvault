import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zilvault/src/blocs/bloc/balance_bloc.dart';

class BalancePage extends StatelessWidget {
  const BalancePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: BlocBuilder<BalanceBloc, BalanceState>(
          builder: (context, state) {
            final String balance = state.balance;
            if (state is BalanceUpdatingEvent) {
              return Center(child: CircularProgressIndicator());
            }

            return Text(balance);
          }
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              final balanceBloc = BlocProvider.of<BalanceBloc>(context);
              balanceBloc.add(BalanceUpdateRequestedEvent(address: "AB70efe340afCb01E5164e020C6E6c49ec4dD63C"));
            },
        ),
        ],
      ),
    );
  }
}
