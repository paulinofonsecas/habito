import 'package:habito_2/data/datasource/i_habito_datasource.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
// 2. Data Source Concreta (Supabase Implementation)
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// 3. Repositório de Hábitos (Abstração sobre a fonte de dados)
// -----------------------------------------------------------------------------

class HabitoRepository {
  final HabitoDataSource _dataSource;

  HabitoRepository(this._dataSource);

  Future<Habito> createHabito(Habito habito) async {
    // Pode adicionar lógica de negócios aqui antes de chamar a fonte de dados
    return await _dataSource.createHabito(habito);
  }

  Future<List<Habito>> getAllHabitos() async {
    return await _dataSource.getAllHabitos();
  }

  Future<List<Habito>> getConcluidos() async {
    return await _dataSource.getConcluidos();
  }

  Future<Habito?> getHabitoById(String id) async {
    return await _dataSource.getHabitoById(id);
  }

  Future<Habito> updateHabito(Habito habito) async {
    return await _dataSource.updateHabito(habito);
  }

  Future<void> deleteHabito(String id) async {
    return await _dataSource.deleteHabito(id);
  }
}
