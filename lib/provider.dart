import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';

final List<Expense> _registeredExpenses = [
  Expense(
    title: 'Flutter Course',
    amount: 19.99,
    date: DateTime.now(),
    category: Category.work,
  ),
  Expense(
    title: 'Cinema',
    amount: 15.69,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: 'Flutter Course',
    amount: 15.69,
    date: DateTime.now(),
    category: Category.leisure,
  )
];

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  // We initialize the list of todos to an empty list
  ExpenseNotifier() : super(_registeredExpenses);

  void addExpense(
      {required String title,
      required double amount,
      required Category category,
      required DateTime date}) {
    Expense entry = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );
    state = [...state, entry];
  }

  void removeExpense(Expense expense, BuildContext context) {
    final indexOfExpense = state.indexOf(expense);
    state = state.where((element) => element != expense).toList();

    // remove previous snackbar before showing a new one
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // insert the todo back to the list at the same index
            state = [
              ...state.sublist(0, indexOfExpense),
              expense,
              ...state.sublist(indexOfExpense)
            ];
          },
        ),
      ),
    );
  }
}

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});
