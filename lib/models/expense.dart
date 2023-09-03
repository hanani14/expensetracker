import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
//for create unique id
const uuid = Uuid();

//date format
final formatter = DateFormat.yMd();

//defined allow value
enum Category{
  food, travel, leisure, work
}

//assign icon for enum value
const categoryIcons ={
  Category.food: Icons.lunch_dining,
  Category.travel : Icons.flight_takeoff,
  Category.leisure : Icons.movie,
  Category.work : Icons.work,
};

class Expense{
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category; 
  Expense({required this.category,required this.title,required this.amount,required this.date})
  : id = uuid.v4();


  String get formattedDate {
    return formatter.format(date);
  }
}