import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                child: Text('\$${transaction.amount}'),
              ),
            ),
          ),
          title: Text(
            transaction.title!,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date!),
          ),
          trailing: MediaQuery.of(context).size.width > 360
              ? TextButton.icon(
                  onPressed: () => deleteTx(transaction.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : IconButton(
                  onPressed: () => deleteTx(transaction.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                )),
    );
  }
}
