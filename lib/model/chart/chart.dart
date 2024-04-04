// ignore_for_file: camel_case_types, unused_local_variable

import 'package:expenses/model/chart/chart_bar.dart';
import 'package:expenses/model/expense.dart';
import 'package:flutter/material.dart';

class chart extends StatelessWidget {
  const chart({super.key, required this.chartExpense});

  final List<Expense> chartExpense;

  List<expenseBucket> get buckets {
    return [
      expenseBucket.forCategory(
          category: Category.education, allExpenses: chartExpense),
      expenseBucket.forCategory(
          category: Category.food, allExpenses: chartExpense),
      expenseBucket.forCategory(
          category: Category.leisure, allExpenses: chartExpense),
      expenseBucket.forCategory(
          category: Category.work, allExpenses: chartExpense),
      expenseBucket.forCategory(
          category: Category.travel, allExpenses: chartExpense),
      expenseBucket.forCategory(
          category: Category.healthcare, allExpenses: chartExpense),
    ];
  }

  double get maxTotalExpenses {
    double maxTotalExpenses = 0;

    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpenses) {
        maxTotalExpenses = element.totalExpenses;
      }
    }
    return maxTotalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
          Theme.of(context).colorScheme.primary.withOpacity(0.0),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (final element in buckets)
                  chartBar(
                    fill: element.totalExpenses == 0
                        ? 0
                        : element.totalExpenses / maxTotalExpenses,

                    ///here we are useing if statment
                  ),
                const SizedBox(
                  height: 12,
                ),

                /// note this is how we use for loop in (Flutter) not dart only in Flutter
              ],
            ),
          ),
          Expanded(
            child: Row(
                children: buckets
                    .map(
                      (e) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            categoryIcons[e.category],
                            color: isDarkMode
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7),
                          ),
                        ),
                      ),

                      /// note we can use here for loop insted of map, but as you like both work
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}
