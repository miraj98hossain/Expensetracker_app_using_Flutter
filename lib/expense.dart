import 'package:expensetracker/add_Expense.dart';
import 'package:expensetracker/expenselist.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/models/expenses.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _RegedList = [
    Expenses(
        title: "Flutter Project",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expenses(
        title: "Movie",
        amount: 15,
        date: DateTime.now(),
        category: Category.leisure),
    Expenses(
        title: "Burger",
        amount: 8,
        date: DateTime.now(),
        category: Category.food)
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewExpense(addExpense: addExpense);
      },
    );
  }

  void addExpense(Expenses expense) {
    setState(() {
      _RegedList.add(expense);
    });
  }

  void removeExpense(Expenses expense) {
    setState(() {
      _RegedList.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Expense Tracker')),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text(
            'The Chart',
          ),
          Expanded(
              child: Expenselist(
            expenses: _RegedList,
            removeExpense: removeExpense,
          )),
        ],
      ),
    );
  }
}
