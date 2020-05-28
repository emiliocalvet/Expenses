import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final void Function(String) _onRemove;

  TransactionList(this._transactions, this._onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 572,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 100),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (ctx, index) {
                final transaction = _transactions[index];
                return Card(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 6),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('R\$${transaction.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(transaction.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => _onRemove(transaction.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
