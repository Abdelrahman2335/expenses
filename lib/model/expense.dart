import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {food, travel, leisure, work, healthcare, education}

class Expense {
  final String? id;
  final String? title;
  final double? amount;
  final DateTime? date;
  final Category? category;
  Expense(
      {
      required this.category,
      required this.title,
      required this.amount,
      required this.date
      }): id = uuid.v4();
}

var v1 = Expense(category: Category.education, title: "Mobile app devolopment", amount: 15000, date: DateTime.now(),);