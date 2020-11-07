import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountcontroller = TextEditingController();

  final titlecontroller = TextEditingController();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
                keyboardType: TextInputType.number,
                controller: amountcontroller,
                onSubmitted: (val) => submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text('No Date Chosen'),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Add Transaction"),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData,
              ),
            ],
          ),
        ));
  }
}
