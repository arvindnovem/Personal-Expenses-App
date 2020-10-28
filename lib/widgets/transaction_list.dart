import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      return Card(
          child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${tx.amount}', //String interpolation
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              )),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(tx.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(DateFormat().format(tx.date),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ]),
        ],
      ));
    }).toList());
  }
}
