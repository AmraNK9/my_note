import 'package:my_note/business_logic/database/database.dart';
import 'package:my_note/models/Notes.dart';

class TaskRepo {
  final dbProvider = DBProvider.db;
  Future<int> createNote(Note note) async {
    final db = await dbProvider.database;
    int result = await db.insert("Note", note.toDatabaseJson());
    return result;
  }

  Future<List<Note>> getAllNotes() async {
    List<Note> result = [];

    final db = await dbProvider.database;
    List<Map<String,dynamic>> mapResult = await db.query("Note");
    result =  mapResult.isNotEmpty
        ? mapResult.map((e) => Note.fromDatabaseJson(e)).toList()
        : [];
    return result;
  }

  Future<int> update(Note note) async {
    final db = await dbProvider.database;
    int result = await db.update("Note", note.toDatabaseJson());
    return result;
  }
  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    int result = await db.delete("Note",where: "id = ?",whereArgs: [id]);
    return result;
  }
  Future<int> deleteAll() async {
    final db = await dbProvider.database;
    int result = await db.delete("Note",where: "isDeleted = ?",whereArgs: [1]);
    return result;
  }
}
