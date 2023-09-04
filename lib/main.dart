import 'package:expensetracker/views/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

var kDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark,seedColor: Color.fromARGB(255, 28, 13, 122));
void main() {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(  
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal:16,vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: kDarkColorScheme.primaryContainer,foregroundColor: kDarkColorScheme.onPrimaryContainer)),
        useMaterial3: true,colorScheme: kDarkColorScheme),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(useMaterial3: true,
        colorScheme:kColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal:16,vertical: 8)
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(fontWeight: FontWeight.bold,color: kColorScheme.onSecondaryContainer,fontSize: 16)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: kColorScheme.primaryContainer)),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
          
        ),
      home: const Expenses(),
    ),
  );
}