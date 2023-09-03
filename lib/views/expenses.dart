import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/views/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(category: Category.travel, title: 'Sim', amount: 20.99, date: DateTime.now()),
    Expense(category: Category.leisure, title: 'Avengers', amount: 25.59, date: DateTime.now()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children:  [
        const Text('The chart'),
        Expanded(child: ExpensesList(expenses: _registeredExpenses)),
      ],
    ),);

  }
}