import 'package:flutter/material.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/domain/usecases/habito_usecases.dart';

class DailyHabitsDoneNotifier with ChangeNotifier {
  DailyHabitsDoneNotifier({
    required ObterListaHabitosConcluidosUseCase
        obterListaHabitosConcluidosUseCase,
  }) : _obterListaHabitosConcluidosUseCase = obterListaHabitosConcluidosUseCase;

  final ObterListaHabitosConcluidosUseCase _obterListaHabitosConcluidosUseCase;
  final List<Habito> _habitosConcluidos = [];
  var isLoading = false;

  List<Habito> get habitosConcluidos =>
      _habitosConcluidos..sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));

  void loadHabitosConcluidos() async {
    final list = await _obterListaHabitosConcluidosUseCase.executar();

    _habitosConcluidos.clear();
    _habitosConcluidos.addAll(list);

    notifyListeners();
  }
}
