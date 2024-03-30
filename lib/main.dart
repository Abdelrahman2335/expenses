import 'package:expenses/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
var myDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
        colorScheme: myColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
            color: myColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: myColorScheme.primaryContainer
        ),
      ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 16,
          )
        ),
      ),darkTheme: ThemeData.dark().copyWith(
        colorScheme: myDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
          foregroundColor: myDarkColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
            color: myDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8)),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: myDarkColorScheme.primaryContainer
        ),
      ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 16,
          )
        ),
      bottomSheetTheme: BottomSheetThemeData().copyWith(
        backgroundColor: myDarkColorScheme.secondaryContainer,
      ),

      ),

      home: const Expenses(),
    );
  }
}
