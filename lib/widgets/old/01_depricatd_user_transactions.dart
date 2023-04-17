import 'package:flutter/material.dart';
import '../../models/transactions.dart';
import '../new_transaction.dart';
import '../transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _usertransactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Accessories",
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "New Shoes",
      amount: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t4",
      title: "Accessories",
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t5",
      title: "New Shoes",
      amount: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t6",
      title: "Accessories",
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t7",
      title: "New Shoes",
      amount: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t8",
      title: "Accessories",
      amount: 200,
      date: DateTime.now(),
    ),
  ];
  int id = 9;

  void _addTransaction(String txTitle, double txAmount) {
    final txItem = Transaction(
      id: 't${id++}',
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _usertransactions.add(txItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        Transactions(_usertransactions),
      ],
    );
  }
}
