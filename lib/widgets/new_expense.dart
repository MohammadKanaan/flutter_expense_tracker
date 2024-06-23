import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NewExpense extends HookConsumerWidget {
  const NewExpense({super.key});

  void _handleAddExpense(BuildContext context, WidgetRef ref, String title,
      double amount, Category category, DateTime date) {
    ref.watch(expenseProvider.notifier).addExpense(
          title: title.trim(),
          amount: amount,
          category: category,
          date: date,
        );
  }

  void _showDatePicker(
      BuildContext context, ValueNotifier<DateTime> date) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    date.value = pickedDate!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var title = useState('');
    var amount = useState(0.0);
    var date = useState(DateTime.now());
    var category = useState(Category.other);

    final int day = date.value.day;
    final int month = date.value.month;
    final int year = date.value.year;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            onChanged: (value) {
              title.value = value;
            },
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    amount.value = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefix: Text('\$ '),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$day-$month-$year'),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        _showDatePicker(context, date);
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Category: '),
              const SizedBox(width: 10),
              DropdownButton(
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
                  value: category.value,
                  onChanged: (value) {
                    category.value = value!;
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  if (title.value.trim().isEmpty || amount.value <= 0.0) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Invalid Input'),
                        content: const Text(
                            'Please enter a valid title and amount.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }
                  _handleAddExpense(context, ref, title.value, amount.value,
                      category.value, date.value);
                  Navigator.pop(context);
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
