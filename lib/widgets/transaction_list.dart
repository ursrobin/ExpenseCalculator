import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactionsList;
  Transactions(this.transactionsList);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 660,
      child: transactionsList.isEmpty
          ? Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "No transactions done yet!!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: ((ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\u20B9 ${(transactionsList[index].amount).toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionsList[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(transactionsList[index].date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              itemCount: transactionsList.length,
            ),
    );
  }
}
