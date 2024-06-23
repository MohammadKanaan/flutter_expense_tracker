import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

Icon getIcon({required Category category, double size = 12.0}) {
  switch (category) {
    case Category.food:
      return Icon(
        CustomIcons.hamburger,
        size: size,
      );
    case Category.travel:
      return Icon(
        CustomIcons.flight,
        size: size,
      );
    case Category.work:
      return Icon(
        Icons.business_center,
        size: size,
      );
    case Category.leisure:
      return Icon(
        CustomIcons.umbrella_beach,
        size: size -
            size / 6, // Adjust size to accomodate this icon's larger size
      );
    case Category.other:
      return Icon(
        CustomIcons.question,
        size: size,
      );
  }
}

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({required this.expense, super.key});

  @override
  Widget build(BuildContext context) {
    final int day = expense.date.day;
    final int month = expense.date.month;
    final int year = expense.date.year;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            getIcon(category: expense.category, size: 40),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    const Icon(CustomIcons.calendar, size: 12),
                    const SizedBox(width: 5),
                    Text('$day-$month-$year'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
