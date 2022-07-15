import 'package:floor/floor.dart';
import 'package:untitled2/entity/notes.dart';

@dao
abstract class NotesDao{
  @Query('SELECT * FROM Notes')
  Stream<List<Notes>> getAllNotes();

  @insert
  Future<void> insertNote(Notes note);

  @update
  Future<void> updateNote(Notes note);

  @delete
  Future<void> deleteNote(Notes note);
}