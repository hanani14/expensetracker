import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/views/expenses_list/expenses_list.dart';
import 'package:expensetracker/views/new_expense.dart';
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

  void _openAddExpenseOverlay(){
    //context : contains metadata information of widget
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (ctx)=>  NewExpense(onAddExpense:_addExpense));
  }
  
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndaex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(seconds: 3),content: const Text('Expense deleted.'),action: SnackBarAction(label: 'Undo',onPressed: (){setState(() {
      _registeredExpenses.insert(expenseIndaex, expense);
    });},),));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainCOntent = const Center(child: Text('No expense found. Start adding some!'),);
    if(_registeredExpenses.isNotEmpty){
      mainCOntent = ExpensesList(expenses: _registeredExpenses,onRemoveExpense: _removeExpense,);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
        IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),

      ]),
      body: Column(
      children:  [
        const Text('The chart'),
        Expanded(child: mainCOntent),
      ],
    ),);

  }
}