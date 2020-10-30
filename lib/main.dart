import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _usertransactions = [
    Transactions(
      id: 't1',
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: "New Dress",
      amount: 89.99,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transactions(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _usertransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App'), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        )
      ]),
      body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("PICKUP"),
              elevation: 5,
            )),
        TransactionList(_usertransactions),
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
