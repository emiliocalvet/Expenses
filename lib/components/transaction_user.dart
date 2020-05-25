import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = <Transaction>[
    Transaction(
      id: 't1',
      title: 'Novo SSD',
      value: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de Água',
      value: 47.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta da Internet',
      value: 108.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Nova Cadeira',
      value: 284.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Nova Memória RAM',
      value: 312,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),  
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}