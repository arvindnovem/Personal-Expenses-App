import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final amountcontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
                onSubmitted: (val) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountcontroller,
                onSubmitted: (val) => submitData(),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                textColor: Colors.purple,
                onPressed: submitData,
              ),
            ],
          ),
        ));
  }
}
