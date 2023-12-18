import 'dart:io';

import 'package:expensetracker/global/separator.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
            Separator().heightSeperator(4),
            Row(children: [
              Text('RM ${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  Separator().widthSeperator(8),
                  Text(expense.formattedDate),
                ],
              ),
            ],),
            expense.path != null?
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(expense.path!),
              ),
            ):Container()
          ],
        ),
      ),);
  }
}