import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkAppTheme,
      theme: appTheme,
      home: const Expenses(),
      themeMode: ThemeMode.system,
    );
  }
}
