import 'package:flutter/material.dart';

class HabitHistory extends StatelessWidget {
  final int year; // Ano para calcular as semanas
  final Color completedColor;
  final Color incompleteColor;
  final double squareSize;
  final double squareSpacing;
  final EdgeInsets padding;

  const HabitHistory({
    super.key,
    required this.year,
    this.completedColor = Colors.green,
    this.incompleteColor = Colors.grey,
    this.squareSize = 15.0,
    this.squareSpacing = 5.0,
    this.padding = const EdgeInsets.all(10.0),
  });

  // Função para obter o número de semanas em um ano
  int getWeeksInYear(int year) {
    DateTime firstDate = DateTime(year);
    DateTime lastDate = DateTime(year + 1);
    return ((lastDate.difference(firstDate).inDays) / 7).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: squareSize,
      height: squareSize,
      margin: EdgeInsets.all(
        squareSpacing / 2,
      ), // Ajusta o margin para o espaçamento
      decoration: BoxDecoration(
        color: completedColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
