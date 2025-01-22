import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:habito_2/domain/entities/habito/habito.dart'; // Substitua pelo caminho correto
import 'package:habito_2/data/datasource/i_habito_datasource.dart'; // Substitua pelo caminho correto

class SqliteHabitoDataSource implements HabitoDataSource {
  static const String _dbName = 'habito_database.db';
  static const String _tableName = 'habitos';
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE habitos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        affirmation_type TEXT NOT NULL,
        affirmation_text TEXT NOT NULL,
        regularity_days TEXT,
        daily_recurrence INTEGER NOT NULL DEFAULT 1,
        reminders TEXT,
        iconCode INTEGER,
        color_hex INTEGER,
        completed_dates TEXT,
        last_completed_at TEXT,
        created_at TEXT,
        updated_at TEXT
      );

      CREATE TABLE affirmations (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        type TEXT NOT NULL,
        text TEXT NOT NULL,
        habito_id TEXT NOT NULL,
        FOREIGN KEY (habito_id) REFERENCES habitos(id)
      );
    ''');
  }

  @override
  Future<Habito> createHabito(Habito habito) async {
    final db = await database;
    await db.insert(
      _tableName,
      habito.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace, //ou ignore
    );
    return habito;
  }

  @override
  Future<List<Habito>> getAllHabitos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return Habito.fromJson(maps[i]);
    });
  }

  @override
  Future<Habito?> getHabitoById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Habito.fromJson(maps.first);
  }

  @override
  Future<Habito> updateHabito(Habito habito) async {
    final db = await database;
    await db.update(
      _tableName,
      habito.toJson(),
      where: 'id = ?',
      whereArgs: [habito.id],
    );
    return habito;
  }

  @override
  Future<void> deleteHabito(String id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Habito>> getConcluidos() async {
    final db = await database;
    // Adapte a query para refletir como 'completed_dates' é armazenado no banco de dados.
    // Exemplo assumindo que completed_dates é uma string JSON:
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM $_tableName WHERE LENGTH(completed_dates) > 0"); //ou outra condição apropriada
    return List.generate(maps.length, (i) {
      return Habito.fromJson(maps[i]);
    });
  }
}
