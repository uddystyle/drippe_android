import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppRecipeDatabase {
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'recipe.db');

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recipe(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ratio TEXT,
        label TEXT,
        grind TEXT,
        roast TEXT,
        memo TEXT
      )
    ''');
  }
}
