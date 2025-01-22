import 'package:habito_2/data/repository/habito_repository.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';

// -----------------------------------------------------------------------------
// 4. Atualização dos Use Cases para usar o Repositório
// -----------------------------------------------------------------------------

/// **Use Case 1: Criar um Hábito**
class CriarHabitoUseCase {
  final HabitoRepository _habitoRepository;

  CriarHabitoUseCase(this._habitoRepository);

  Future<Habito> executar({
    required Habito novoHabito,
  }) async {
    // Validações (ex: nome não pode ser vazio, frequência deve ser válida)
    if (novoHabito.nome.isEmpty) {
      throw ArgumentError('O nome do hábito não pode ser vazio.');
    }
    // ... outras validações ...

    // final novoHabito = Habito(
    //   id: Uuid().v4(),
    //   nome: nome,
    //   descricao: descricao,
    //   frequencia: frequencia,
    //   meta: meta,
    //   unidadeMeta: unidadeMeta,
    //   lembrete: lembrete,
    //   dataInicio: dataInicio ?? DateTime.now(),
    //   categoria: categoria,
    //   prioridade: prioridade,
    //   notas: notas,
    // );

    return await _habitoRepository
        .createHabito(novoHabito); // Usar o repositório para salvar
  }
}

/// **Use Case 2: Obter Lista de Hábitos**
class ObterListaHabitosUseCase {
  final HabitoRepository _habitoRepository;

  ObterListaHabitosUseCase(this._habitoRepository);

  Future<List<Habito>> executar(/* Filtros e Ordenação Opcionais */) async {
    return await _habitoRepository
        .getAllHabitos(); // Usar o repositório para buscar
  }
}

/// **Use Case 3: Obter Lista de Hábitos Concluídos**
class ObterListaHabitosConcluidosUseCase {
  final HabitoRepository _habitoRepository;

  ObterListaHabitosConcluidosUseCase(this._habitoRepository);

  Future<List<Habito>> executar(/* Filtros e Ordenação Opcionais */) async {
    return await _habitoRepository
        .getConcluidos(); // Usar o repositório para buscar
  }
}

/// **Use Case 3: Obter Detalhes de um Hábito**
class ObterDetalhesHabitoUseCase {
  final HabitoRepository _habitoRepository;

  ObterDetalhesHabitoUseCase(this._habitoRepository);

  Future<Habito?> executar({required String habitoId}) async {
    return await _habitoRepository
        .getHabitoById(habitoId); // Usar o repositório para buscar por ID
  }
}

/// **Use Case 4: Atualizar um Hábito**
class AtualizarHabitoUseCase {
  final HabitoRepository _habitoRepository;

  AtualizarHabitoUseCase(this._habitoRepository);

  Future<Habito> executar({required Habito habito}) async {
    // Validações antes de atualizar (ex: nome não pode ser vazio, frequência deve ser válida)
    if (habito.nome.isEmpty) {
      throw ArgumentError('O nome do hábito não pode ser vazio.');
    }
    // ... outras validações ...

    return await _habitoRepository
        .updateHabito(habito); // Usar o repositório para atualizar
  }
}

/// **Use Case 5: Excluir um Hábito**
class ExcluirHabitoUseCase {
  final HabitoRepository _habitoRepository;

  ExcluirHabitoUseCase(this._habitoRepository);

  Future<void> executar({required String habitoId}) async {
    return await _habitoRepository
        .deleteHabito(habitoId); // Usar o repositório para excluir
  }
}

/// **Use Case 6: Marcar Hábito como Concluído**
class MarcarHabitoConcluidoUseCase {
  final HabitoRepository _habitoRepository;
  final ObterDetalhesHabitoUseCase
      _obterDetalhesHabitoUseCase; // Pode precisar buscar o habito primeiro

  MarcarHabitoConcluidoUseCase(
      this._habitoRepository, this._obterDetalhesHabitoUseCase);

  Future<Habito> executar(
      {required String habitoId, DateTime? dataConclusao}) async {
    final data = dataConclusao ?? DateTime.now();
    // Buscar o hábito para atualizar
    Habito? habito =
        await _obterDetalhesHabitoUseCase.executar(habitoId: habitoId);

    if (habito == null) {
      throw ArgumentError('Hábito não encontrado com ID: $habitoId');
    }

    // Criar uma nova lista de conclusões (imutabilidade)
    List<DateTime> historicoAtualizado = List.from(habito.completedDates);

    // Verificar se já não foi concluído na data (para evitar duplicações)
    if (!historicoAtualizado.any((date) =>
        date.year == data.year &&
        date.month == data.month &&
        date.day == data.day)) {
      historicoAtualizado.add(data);
    }

    final novoHabito = habito.copyWith(
      completedDates: historicoAtualizado,
      lastCompletedAt: data,
    );

    // Persistir a atualização usando o repositório
    return await _habitoRepository.updateHabito(novoHabito);
  }
}

/// **Use Case 7: Desmarcar Hábito como Concluído**
class DesmarcarHabitoConcluidoUseCase {
  final HabitoRepository _habitoRepository;
  final ObterDetalhesHabitoUseCase
      _obterDetalhesHabitoUseCase; // Pode precisar buscar o habito primeiro

  DesmarcarHabitoConcluidoUseCase(
      this._habitoRepository, this._obterDetalhesHabitoUseCase);

  Future<Habito> executar(
      {required String habitoId, DateTime? dataConclusao}) async {
    final data = dataConclusao ?? DateTime.now();
    // Buscar o hábito para atualizar
    Habito? habito =
        await _obterDetalhesHabitoUseCase.executar(habitoId: habitoId);

    if (habito == null) {
      throw ArgumentError('Hábito não encontrado com ID: $habitoId');
    }

    // Criar uma nova lista de conclusões (imutabilidade)
    List<DateTime> historicoAtualizado = List.from(habito.completedDates);

    // Remove the passed data from the list, if exists
    historicoAtualizado.removeWhere((date) =>
        date.year == data.year &&
        date.month == data.month &&
        date.day == data.day);

    final sortedCompletedDates = historicoAtualizado.toList();
    sortedCompletedDates.sort((a, b) => b.compareTo(a));

    final novoHabito = habito.copyWith(
      completedDates: historicoAtualizado,
      lastCompletedAt:
          sortedCompletedDates.isEmpty ? null : sortedCompletedDates.first,
    );

    // Persistir a atualização usando o repositório
    return await _habitoRepository.updateHabito(novoHabito);
  }
}
