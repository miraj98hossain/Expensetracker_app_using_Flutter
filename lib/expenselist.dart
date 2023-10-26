import 'package:expensetracker/expenseitem.dart';
import 'package:expensetracker/models/expenses.dart';
import 'package:flutter/material.dart';

class Expenselist extends StatelessWidget {
  const Expenselist({super.key, required this.expenses});
  final List<Expenses> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseItem(expenses: expenses[index]);
      },
    );
  }
}
