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
  final updateHabitoUseCase = sl<AtualizarHabitoUseCase>();
  final marcarHabitoConcluidoUseCase = sl<MarcarHabitoConcluidoUseCase>();
  final desmarcarHabitoConcluidoUseCase = sl<DesmarcarHabitoConcluidoUseCase>();

  final List<Habito> _habitos = [];
  var isLoading = false;

  DateTime focusedDate = DateTime.now();

  List<Habito> get habitos {
    return _habitos
      ..sort((Habito a, Habito b) => b.createdAt!.compareTo(a.createdAt!));
  }

  void listarHabitos() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    final habitos = await obterListaHabitosUseCase.executar(focusedDate);

    _habitos.clear();
    _habitos.addAll(habitos);

    isLoading = false;

    notifyListeners();
  }

  concluirHabito(Habito habito, DateTime? dataConclusao) async {
    await marcarHabitoConcluidoUseCase.executar(
        habitoId: habito.uuid, dataConclusao: dataConclusao);
    return listarHabitos();
  }

  desconcluirHabito(Habito habito, DateTime? dataConclusao) async {
    await desmarcarHabitoConcluidoUseCase.executar(
        habitoId: habito.uuid, dataConclusao: dataConclusao);
    return listarHabitos();
  }

  void changeDate(DateTime newFocusedDate) async {
    focusedDate = newFocusedDate;
    return listarHabitos();
  }

  void arquivarHabito(Habito habito) async {
    final newHabito = habito.copyWith(isActive: false);
    await updateHabitoUseCase.executar(habito: newHabito);

    return listarHabitos();
  }

  void desarquivarHabito(Habito habito) async {
    final newHabito = habito.copyWith(isActive: true);
    await updateHabitoUseCase.executar(habito: newHabito);

    return listarHabitos();
  }
}
