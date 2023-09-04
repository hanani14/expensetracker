import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/views/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,required this.expenses,required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:expenses.length ,
      itemBuilder: (item,index) => Dismissible(
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]))
      
      );
  }
}