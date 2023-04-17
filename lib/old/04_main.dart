// upto 95
import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  ];
  int id = 3;

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

  void _startAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addTransaction),
          );
        });
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Calculator"),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddTransactionModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Card(
              color: Color.fromARGB(255, 0, 3, 6),
              elevation: 5,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Chart!! i m being mad",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Transactions(_usertransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransactionModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
