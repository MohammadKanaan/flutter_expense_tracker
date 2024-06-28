import 'package:expense_tracker/providers/theme_mode_provider.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Expenses extends ConsumerWidget {
  const Expenses({super.key});

  void _openNewExpenseOverlay(BuildContext context) {
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
    final themeModeSetter = ref.watch(themeModeProvider.notifier);
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: () => themeModeSetter.toggleThemeMode(),
            icon: Icon(themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
          ),
        ],
      ),
      body: const HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openNewExpenseOverlay(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const PieChartSample(), ExpensesList()],
    );
  }
}
