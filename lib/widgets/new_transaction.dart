import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final amountcontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titlecontroller,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountcontroller,
              ),
              FlatButton(
                child: Text("Add Transaction"),
                textColor: Colors.purple,
                onPressed: () {
                  addTx(titlecontroller.text,
                      double.parse(amountcontroller.text));
                },
              ),
            ],
          ),
        ));
  }
}
