import 'package:expensetracker/models/expenses.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            maxLength: 20,
            decoration: const InputDecoration(
              label: Text("Amount"),
              prefix: Text(
                "\$",
              ),
            ),
          ),
          Text(
            _selectedDate == null
                ? "No Date Selected"
                : formater.format(_selectedDate!),
          ),
          IconButton(
            onPressed: () async {
              final now = DateTime.now();
              final firstdate = DateTime(now.year - 1, now.month, now.day);
              final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: firstdate,
                  lastDate: DateTime.now());
              setState(() {
                _selectedDate = pickedDate;
              });
            },
            icon: const Icon(Icons.calendar_month),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _amountController.text = '';
                  _titleController.text = '';
                  Navigator.pop(context);
                },
                child: const Text("Cancle"),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
