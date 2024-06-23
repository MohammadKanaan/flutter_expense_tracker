import 'package:expense_tracker/provider.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PieChartSample extends HookConsumerWidget {
  const PieChartSample({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var expenses = ref.watch(expenseProvider);
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(expenses),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(List<Expense> expenses) {
    return List.generate(5, (i) {
      const fontSize = 16.0;
      const radius = 100.0;
      const widgetSize = 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          var percentage =
              ExpenseBucket.forCategory(expenses, Category.food).totalAmount /
                  ExpenseBucket(expenses: expenses, category: Category.food)
                      .totalAmount;
          return PieChartSectionData(
            color: Colors.lightBlue,
            value: percentage,
            title: '${(percentage * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: getIcon(
                category: Category.food, size: widgetSize - widgetSize / 6),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          var percentage = ExpenseBucket.forCategory(expenses, Category.leisure)
                  .totalAmount /
              ExpenseBucket(expenses: expenses, category: Category.leisure)
                  .totalAmount;
          return PieChartSectionData(
            color: Colors.orange,
            value: percentage,
            title: '${(percentage * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: getIcon(category: Category.leisure, size: widgetSize),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          var percentage =
              ExpenseBucket.forCategory(expenses, Category.travel).totalAmount /
                  ExpenseBucket(expenses: expenses, category: Category.travel)
                      .totalAmount;
          return PieChartSectionData(
            color: Colors.deepPurple,
            value: percentage,
            title: '${(percentage * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: getIcon(category: Category.travel, size: widgetSize),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          var percentage =
              ExpenseBucket.forCategory(expenses, Category.work).totalAmount /
                  ExpenseBucket(expenses: expenses, category: Category.work)
                      .totalAmount;
          return PieChartSectionData(
            color: Colors.lightGreen,
            value: percentage,
            title: '${(percentage * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: getIcon(category: Category.work, size: widgetSize),
            badgePositionPercentageOffset: .98,
          );
        case 4:
          var percentage =
              ExpenseBucket.forCategory(expenses, Category.other).totalAmount /
                  ExpenseBucket(expenses: expenses, category: Category.other)
                      .totalAmount;
          return PieChartSectionData(
            color: Colors.red[400],
            value: percentage,
            title: '${(percentage * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: getIcon(category: Category.other, size: widgetSize),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}
