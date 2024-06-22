import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Text('Chart'), ExpensesList()],
    );
  }
}
