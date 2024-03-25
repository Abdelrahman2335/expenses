import 'package:expenses/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Text(expense.title),
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
                  Icon(categoryIcons[expense.category]?.icon),
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
