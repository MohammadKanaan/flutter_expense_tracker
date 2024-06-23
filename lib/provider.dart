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

  void removeExpense(Expense expense) {
    state = state.where((element) => element != expense).toList();
  }
}

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});
