import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/provider.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpensesList extends HookConsumerWidget {
  ExpensesList({super.key});
  final ScrollController scrollController = ScrollController();

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Expense> registeredExpenses = ref.watch(expenseProvider);

    Widget mainContent = const Center(
      child: Text(
        'No expenses found.',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
    if (registeredExpenses.isEmpty) {
      return mainContent;
    }

    return Expanded(
      child: Stack(
        children: [
          Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              controller: scrollController,
              reverse: true,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: registeredExpenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: ValueKey(registeredExpenses[index]),
                    onDismissed: (direction) => ref
                        .read(expenseProvider.notifier)
                        .removeExpense(registeredExpenses[index]),
                    child: ExpenseItem(expense: registeredExpenses[index]));
              },
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                _openAddExpenseOverlay(context);
                scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
