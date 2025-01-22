import 'package:habito_2/domain/entities/habito/habito.dart';

// -----------------------------------------------------------------------------
// 1. Data Source Abstração (Interface)
// -----------------------------------------------------------------------------

abstract class HabitoDataSource {
  Future<Habito> createHabito(Habito habito);
  Future<List<Habito>> getAllHabitos();
  Future<List<Habito>> getConcluidos();
  Future<Habito?> getHabitoById(String id);
  Future<Habito> updateHabito(Habito habito);
  Future<void> deleteHabito(String id);
}
