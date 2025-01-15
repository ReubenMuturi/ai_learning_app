// // lib/database/database_helper.dart
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'dart:async';

// class DatabaseHelper {
//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }

//   initDatabase() async {
//     return await openDatabase(
//       join(await getDatabasesPath(), 'app_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, progress INTEGER)",
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<void> insertUser(Map<String, dynamic> user) async {
//     final db = await database;
//     await db.insert('user', user, conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   Future<List<Map<String, dynamic>>> getUsers() async {
//     final db = await database;
//     return await db.query('user');
//   }
// }






import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  /// Initialize or retrieve the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialize the SQLite database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Create tables for lessons, progress, and synced data
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE lessons (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        content TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE user_progress (
        id INTEGER PRIMARY KEY,
        lesson_id INTEGER,
        progress INTEGER,
        FOREIGN KEY (lesson_id) REFERENCES lessons (id)
      )
    ''');
    await db.execute('''
      CREATE TABLE sync_status (
        id INTEGER PRIMARY KEY,
        data_type TEXT,
        last_synced TEXT
      )
    ''');
  }

  // CRUD Operations for Lessons
  Future<int> insertLesson(Map<String, dynamic> lesson) async {
    final db = await database;
    return await db.insert('lessons', lesson);
  }

  Future<List<Map<String, dynamic>>> fetchAllLessons() async {
    final db = await database;
    return await db.query('lessons');
  }

  Future<int> updateLesson(int id, Map<String, dynamic> lesson) async {
    final db = await database;
    return await db.update(
      'lessons',
      lesson,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteLesson(int id) async {
    final db = await database;
    return await db.delete(
      'lessons',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD Operations for User Progress
  Future<int> insertProgress(Map<String, dynamic> progress) async {
    final db = await database;
    return await db.insert('user_progress', progress);
  }

  Future<List<Map<String, dynamic>>> fetchProgressByLesson(int lessonId) async {
    final db = await database;
    return await db.query(
      'user_progress',
      where: 'lesson_id = ?',
      whereArgs: [lessonId],
    );
  }

  Future<int> updateProgress(int id, Map<String, dynamic> progress) async {
    final db = await database;
    return await db.update(
      'user_progress',
      progress,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteProgress(int id) async {
    final db = await database;
    return await db.delete(
      'user_progress',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD Operations for Sync Status
  Future<int> insertSyncStatus(Map<String, dynamic> syncStatus) async {
    final db = await database;
    return await db.insert('sync_status', syncStatus);
  }

  Future<List<Map<String, dynamic>>> fetchSyncStatus() async {
    final db = await database;
    return await db.query('sync_status');
  }

  Future<int> updateSyncStatus(int id, Map<String, dynamic> syncStatus) async {
    final db = await database;
    return await db.update(
      'sync_status',
      syncStatus,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

