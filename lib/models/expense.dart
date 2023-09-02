import 'package:uuid/uuid.dart';

//for create unique id
const uuid = Uuid();

//defined allow value
enum Category{
  food, travel, leisure, work
}

class Expense{
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category; 
  Expense({required this.category,required this.title,required this.amount,required this.date})
  : id = uuid.v4();
}