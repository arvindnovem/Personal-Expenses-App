import 'package:flutter/material.dart';
import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transactions> transactions = [
    Transactions(
      id: 't1',
      title: "New Shoes",
      amount: "69.99",
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: "New Dress",
      amount: "89.99",
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(children: [
          Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("PICKUP"),
                elevation: 5,
              )),
          Card(
            child: Text("Arvind"),
            elevation: 7,
          )
        ]));
  }
}
