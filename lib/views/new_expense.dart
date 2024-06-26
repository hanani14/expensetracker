import 'dart:io';

import 'package:expensetracker/global/separator.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/views/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  String? imgPath;

  void _presentDatePicker()async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1, now.month, now.day);
    final pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
    //first method
    // .then((value) { //once value is available });
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void imagepickers(String path){
     SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          imgPath = path;
    });
    //yourcode
  });
  
    print('image path $imgPath');
  }

  void _submitExpenseData(){
    final enterAmount = double.tryParse(_amountController.text);  //tryParse('Hello) => null, tryParse(1.12)=> 1.12
    final amountIsInvalid = enterAmount == null || enterAmount<= 0;

    if(_titleController.text.trim().isEmpty || amountIsInvalid ||_selectedDate ==null){
      //show error message
      showDialog(context: context, builder: (ctx)=>AlertDialog(
        title: const Text('Invalid input'),
        content: const Text('Please make sure a valid title, amount, date and category was entered.'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: const Text('Okay'))
        ],
      ));
      return;
    }
    widget.onAddExpense(Expense(category: _selectedCategory, title: _titleController.text, amount: enterAmount, date: _selectedDate!,path: File(imgPath!)));
    Navigator.pop(context);
  }
  // var _enteredTitle = '';
  
  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16,48,16,16),
        child:Column(
          children: [
           TextField(
            controller:_titleController,
            // onChanged:_saveTitleInput ,
            maxLength: 50,decoration: const InputDecoration(
            label: Text('Title'),
          ),),
          Row(children: [
            Expanded(
              child: TextField(
                        controller:_amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: 'RM',
                          label: Text('Amount'),
                      ),),
            ),
            Separator().widthSeperator(16),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_selectedDate ==null? 'No date selected': formatter.format(_selectedDate!)),
                IconButton(onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month))
              ],
            ))
          ],),
           Separator().heightSeperator(26),
            const Text('Upload Receipt',textAlign: TextAlign.start,),
            ImagePage(onSelectAnswer: imagepickers,),
            Separator().heightSeperator(16),
          Row(children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values.map((category) => 
                DropdownMenuItem(value: category,child: Text(category.name.toUpperCase()))).toList(), 
              onChanged: (value){
                  if(value == null){
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
            }),
            const Spacer(),
         
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancel')),
            ElevatedButton(onPressed: _submitExpenseData,
             child: const Text('Save Expense'))
          ],)
          
        ],),
      ),
    );
  }
}