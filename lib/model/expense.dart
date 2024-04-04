import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMEd();

enum Category { food, travel, leisure, work, healthcare, education }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.healthcare: Icons.health_and_safety,
  Category.education: Icons.school,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    /// this Function take the date from (date) and format it using the object dateFormat to be year:month:day
    return dateFormat.format(date);
  }

  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}

// ignore: camel_case_types
class expenseBucket {
  expenseBucket({required this.category, required this.expense});
  expenseBucket.forCategory(
      {required this.category, required List<Expense> allExpenses})
      : expense = allExpenses.where((element) => element.category == category/**here false mean I dont need this element true mean I need this elemnet */).toList(); 

  final Category category;
  final List<Expense> expense;

  double get totalExpenses {
    double sum = 0;

    for (var element in expense) {
      sum = sum + element.amount;
    }

    return sum;
  }
}
