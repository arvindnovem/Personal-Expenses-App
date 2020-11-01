import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  Chart(this.recentTransactions);
  // ignore: missing_return
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var TotalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          TotalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E(weekDay));
      print(TotalSum);
      return {'day': DateFormat.E(weekDay), 'amount': TotalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 6, margin: EdgeInsets.all(20));
  }
}
