import 'package:expenses/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                  "\$${expense.amount.toStringAsFixed(2)}" // this will show just 2 numbers after (.)
                  ),
              const Spacer(),
              Row(
                children: [
                  /// This line show the user the icons.
                  Icon(
                    categoryIcons[expense.category],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .secondary
                  ),

                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    expense.formatedDate,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
