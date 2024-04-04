import 'package:expenses/bottom_sheet.dart';
import 'package:expenses/expenses_List/expenses_List.dart';
import 'package:expenses/model/chart/chart.dart';
import 'package:expenses/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.work,
      title: "Mobile app development",
      amount: 1500,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.education,
      title: "Web application development",
      amount: 10000,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.travel,
      title: "Travel",
      amount: 8000,
      date: DateTime.now(),
    ),
  ];

  void _addExpense(Expense value) {
    setState(() {
      _registeredExpenses.add(value);
    });
  }

  void _removeExpense(Expense value) {
    setState(() {
      _registeredExpenses.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Expenses Tracker")),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (x) => AddExpense(
                          onAddExpense: _addExpense,));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            chart(chartExpense: _registeredExpenses),
            Expanded(child: ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense))
          ],
        ),
      ),
    );
  }
}
