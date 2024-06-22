import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NewExpense extends HookConsumerWidget {
  const NewExpense({super.key});

  void _handleAddExpense(
      WidgetRef ref, String title, double amount, Category category) {
    ref.read(expenseProvider.notifier).addExpense(
          title: title,
          amount: amount,
          category: category,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var title = useState('');
    var amount = useState(0.0);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              title.value = value;
            },
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            onChanged: (value) {
              amount.value = double.parse(value);
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefix: Text('\$'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  _handleAddExpense(
                      ref, title.value, amount.value, Category.other);
                },
                child: const Text('Add Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
