import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Calculator"),
      ),
      body: Column(
        children: const <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Color.fromARGB(255, 0, 3, 6),
              elevation: 5,
              child: Text(
                "CARD!!",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Card(
            child: Text("List of Transactions"),
          ),
        ],
      ),
    );
  }
}
