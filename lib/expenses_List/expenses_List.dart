import 'package:expenses/expenses_List/expenses_item.dart';
import 'package:expenses/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;

  final void Function(Expense value) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, i) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expenses[i]),

          /// we have to use key here cuz Dismiss can understand that the element that we have select is really what we want to remove.
          /// note my friend that this ValueKey is not required and we just used this class cuz it makes the life easier for us cuz it's dynamic and it's unique for each item
          onDismissed: (direction) => onRemoveExpense(expenses[i]),

          /// this is how we can remove the elements on our app.
          child: ExpensesItem(expense: expenses[i])),

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
