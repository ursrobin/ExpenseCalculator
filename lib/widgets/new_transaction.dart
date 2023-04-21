import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  BuildContext ctx;
  Function addTxFunc;
  NewTransaction(this.addTxFunc, this.ctx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();
  DateTime? _selectedDate;

  void submitdata() {
    final String enteredTitle = titleInputController.text;
    final double enteredAmount = double.parse(amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTxFunc(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _presentDatePicker,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        color: (Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  child: const Text('Choose Date'),
                ),
                (_selectedDate == null)
                    ? const Text(
                        'NO Date Choosed',
                        style: TextStyle(
                          inherit: false,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      )
                    : Text(
                        'Picked Date:${DateFormat.yMd().format(_selectedDate!)}',
                        style: const TextStyle(
                          inherit: false,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: submitdata,
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: (() => Navigator.pop(widget.ctx)),
                  icon: const Icon(Icons.close),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
