import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/Notes.dart';

class NotesDatabaseManager {
  Database? _database;

  Future<void> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'notes_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, createdAt TEXT, category TEXT,color TEXT)',
        );
      },
    );
  }

  Future<int> insertNote(Note note) async {
    if (_database == null) {
      await initializeDatabase();
    }
    print("updated Data : $note");
    return await _database!.insert('notes', note.toMap());
  }

  Future<int> updateNote(Note note) async {
    if (_database == null) {
      await initializeDatabase();
    }
    return await _database!.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    if (_database == null) {
      await initializeDatabase();
    }
    return await _database!.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Note>> getAllNotes() async {
    if (_database == null) {
      await initializeDatabase();
    }
    final List<Map<String, dynamic>> notesMapList = await _database!.query('notes');
    return List.generate(notesMapList.length, (index) {
      return Note.fromMap(notesMapList[index]);
    });
  }

  Future<List<Note>> getNotesByCategory(String category) async {
    if (_database == null) {
      await initializeDatabase();
    }
    final List<Map<String, dynamic>> notesMapList = await _database!.query('notes', where: 'category = ?', whereArgs: [category]);
    return List.generate(notesMapList.length, (index) {
      return Note.fromMap(notesMapList[index]);
    });
  }

  Future<void> closeDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
  }
}