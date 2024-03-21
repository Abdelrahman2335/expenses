import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMEd();

enum Category {food, travel, leisure, work, healthcare, education}

const categoryIcons = {
  Category.food: Icon(Icons.food_bank),
  Category.travel: Icon(Icons.flight_takeoff),
  Category.work: Icon(Icons.work),
  Category.leisure: Icon(Icons.movie),
  Category.healthcare: Icon(Icons.health_and_safety),
  Category.education: Icon(Icons.school),
  
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    /// this Function take the date from (date) and format it using the opject dateFormat to be year:month:day
    return dateFormat.format(date); 
  }

  Expense (
      {
      required this.category,
      required this.title,
      required this.amount,
      required this.date
      }): id = uuid.v4();
}

