import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function addTxFunc;
  NewTransaction(this.addTxFunc);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submitdata() {
    final String enteredTitle = titleInputController.text;
    final double enteredAmount = double.parse(amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    widget.addTxFunc(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleInputController,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountInputController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            TextButton(
              onPressed: submitdata,
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
