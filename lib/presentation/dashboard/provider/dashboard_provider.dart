import 'package:flutter/material.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/domain/usecases/habito_usecases.dart';

class DashboardNotifier with ChangeNotifier {
  // --- Constructor ---
  DashboardNotifier() {
    listarHabitos();
  }

  // --- Use Cases (Get instances from GetIt) ---
  final createHabitoUseCase = sl<CriarHabitoUseCase>();
  final obterListaHabitosUseCase = sl<ObterListaHabitosUseCase>();
  final marcarHabitoConcluidoUseCase = sl<MarcarHabitoConcluidoUseCase>();
  final desmarcarHabitoConcluidoUseCase = sl<DesmarcarHabitoConcluidoUseCase>();

  final List<Habito> _habitos = [];
  var isLoading = false;

  List<Habito> get habitos {
    return _habitos
      ..sort((Habito a, Habito b) => b.createdAt!.compareTo(a.createdAt!));
  }

  void listarHabitos() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    final habitos = await obterListaHabitosUseCase.executar();

    _habitos.clear();
    _habitos.addAll(habitos);

    isLoading = false;

    notifyListeners();
  }

  concluirHabito(Habito habito) async {
    await marcarHabitoConcluidoUseCase.executar(habitoId: habito.uuid);
    return listarHabitos();
  }

  desconcluirHabito(Habito habito) async {
    await desmarcarHabitoConcluidoUseCase.executar(habitoId: habito.uuid);
    return listarHabitos();
  }
}
