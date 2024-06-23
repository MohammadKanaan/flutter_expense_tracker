import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/provider.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpensesList extends HookConsumerWidget {
  ExpensesList({super.key});
  final ScrollController scrollController = ScrollController();

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
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.red.withOpacity(.70),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    onDismissed: (direction) => ref
                        .read(expenseProvider.notifier)
                        .removeExpense(registeredExpenses[index], context),
                    child: ExpenseItem(expense: registeredExpenses[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
