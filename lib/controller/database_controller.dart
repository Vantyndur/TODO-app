import 'dart:async';
import 'package:lista_zadan/model/priority.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lista_zadan/model/task.dart';

DateTime dateTimeFromDb(String dateDb) {
  List<String> dateTab = dateDb.split('-');
  int yyyy = int.parse(dateTab[0]);
  int mm = int.parse(dateTab[1]);
  int dd = int.parse(dateTab[2]);
  return DateTime(yyyy, mm, dd);
}

class DatabaseController {
  static const _dbName = 'mydatabase.db';
  static const _dbVersion = 1;
  static final _database = _initDb();

  /// For production
  static Future<Database> _initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, dateOfBeginning TEXT, priority TEXT)',
        );
      },
      version: _dbVersion,
    );
  }

  static Future<Database> get database async {
    return _database;
  }

  DatabaseController._constructor();
  static final DatabaseController instance = DatabaseController._constructor();

  Future<void> insertTask(Task task) async {
    final db = await _database;
    await db.insert(
      'tasks',
      task.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> tasks() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        description: maps[i]['description'] as String,
        dateOfBeginning: dateTimeFromDb(maps[i]['dateOfBeginning'] as String),
        priority: Priority.fromString(
          priorityStr: maps[i]['priority'] as String,
        ),
      );
    });
  }

  Future<void> updateTask(Task task) async {
    final db = await _database;

    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await _database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
