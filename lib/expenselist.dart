import 'package:expensetracker/expenseitem.dart';
import 'package:expensetracker/models/expenses.dart';
import 'package:flutter/material.dart';

class Expenselist extends StatelessWidget {
  const Expenselist(
      {super.key, required this.expenses, required this.removeExpense});
  final Function(Expenses expenses) removeExpense;
  final List<Expenses> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(index),
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            child: ExpenseItem(expenses: expenses[index]));
      },
    );
  }
}
