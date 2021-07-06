import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:personal_expense/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTx);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'No Transactions Added Yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map(
                  (tx) => TransactionItem(
                    key: UniqueKey(),
                    transaction: tx,
                    deleteTx: deleteTx,
                  ),
                )
                .toList(),
          );
  }
}
