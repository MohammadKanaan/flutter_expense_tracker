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
    return Expanded(
      child: Stack(children: [
        Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            controller: scrollController,
            reverse: true,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: registeredExpenses.length,
            itemBuilder: (context, index) {
              return ExpenseItem(expense: registeredExpenses[index]);
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          // scroll to top button
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        )
      ]),
    );
  }
}
