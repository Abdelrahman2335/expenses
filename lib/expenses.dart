import 'dart:js_interop';

import 'package:expenses/bottom_sheet.dart';
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
      category: Category.work,
      title: "Mobile app devolopment",
      amount: 10570,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.education,
      title: "Web application devolopment",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Working on the app...")),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (x) =>   AddExpense()
                      );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ExpensesList(expenses: _registeredExpenses))
          ],
        ),
      ),
    );
  }
}