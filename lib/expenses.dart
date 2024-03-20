import 'package:expenses/expenses_List/expenses_List.dart';
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
      category: Category.education,
      title: "Mobile app devolopment",
      amount: 15000,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.education,
      title: "Mobile app devolopment",
      amount: 15000,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.education,
      title: "Mobile app devolopment",
      amount: 15000,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Working on the app...")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Text..."),
            Expanded(
                child: ExpensesList(expenses: _registeredExpenses))
          ],
        ),
      ),
    );
  }
}
