import 'dart:convert';

import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/data/datasource/i_habito_datasource.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static const String _key = 'habitos';
  final SharedPreferences sharedPreferences = sl<SharedPreferences>();

  Future<List<Habito>> getHabitos() async {
    final String? habitosJson = sharedPreferences.getString(_key);
    if (habitosJson == null) return [];

    final List<dynamic> habitos = jsonDecode(habitosJson);
    return List.generate(
        habitos.length, (index) => Habito.fromJson(habitos[index]));
  }

  Future<void> saveHabitos(List<Habito> habitos) async {
    final String habitosJson = jsonEncode(habitos);
    await sharedPreferences.setString(_key, habitosJson);
  }

  Future<void> deleteHabitos() async {
    await sharedPreferences.remove(_key);
  }

  Future<void> deleteHabito(String id) async {
    final List<Habito> habitos = await getHabitos();
    habitos.removeWhere((element) => element.uuid == id);
    await saveHabitos(habitos);
  }

  Future<Habito> createHabito(Habito habito) async {
    final List<Habito> habitos = await getHabitos();
    habitos.add(habito);
    await saveHabitos(habitos);
    return habito;
  }

  Future<Habito> updateHabito(Habito habito) async {
    final List<Habito> habitos = await getHabitos();
    final index = habitos.indexWhere((element) => element.uuid == habito.uuid);
    habitos[index] = habito;
    await saveHabitos(habitos);

    return habito;
  }

  Future<Habito?> getHabitoById(String id) async {
    final List<Habito> habitos = await getHabitos();
    return habitos.firstWhere((element) => element.uuid == id);
  }
}

class SPHabitoDatasource implements HabitoDataSource {
  final SPHelper _spHelper = SPHelper();

  SPHabitoDatasource();

  @override
  Future<Habito> createHabito(Habito habito) async {
    try {
      return await _spHelper.createHabito(habito);
    } catch (e) {
      throw Exception('Erro ao criar o habito: $e');
    }
  }

  @override
  Future<void> deleteHabito(String id) async {
    try {
      await _spHelper.deleteHabito(id);
    } catch (e) {
      throw Exception('Erro ao deletar o habito: $e');
    }
  }

  @override
  Future<List<Habito>> getAllHabitos() async {
    try {
      return await _spHelper.getHabitos();
    } catch (e) {
      throw Exception('Erro ao buscar os habitos: $e');
    }
  }

  @override
  Future<List<Habito>> getConcluidos() async {
    try {
      return await _spHelper.getHabitos();
    } catch (e) {
      throw Exception('Erro ao buscar os habitos: $e');
    }
  }

  @override
  Future<Habito?> getHabitoById(String id) async {
    try {
      return await _spHelper.getHabitoById(id);
    } catch (e) {
      throw Exception('Erro ao buscar o habito: $e');
    }
  }

  @override
  Future<Habito> updateHabito(Habito habito) async {
    try {
      return await _spHelper.updateHabito(habito);
    } catch (e) {
      throw Exception('Erro ao atualizar o habito: $e');
    }
  }

  // metodos com try e catch
}
