import 'package:expenses/expenses_List/expenses_item.dart';
import 'package:expenses/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, i) => ExpensesItem(expense: expenses[i]),

      /// when you are using LisView you have to use map and it's render part of the screen then if you scrolled down it render the next part and so on...
      /// so that's not the best choice sometime,
      /// but ListView.builder render the hole page not part of it and you can't use map you have other choices.

      // ListView(
      //   children: [
      //     ..._registeredExpenses.map((e) => Text("${e.title}")).toList(),
      // ],
      // ),
    );
  }
}
