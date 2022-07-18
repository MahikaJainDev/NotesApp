import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:untitled2/dao/notes_dao.dart';

import '../entity/notes.dart';

part 'database.g.dart';

@Database(version:1, entities:[Notes])
abstract class NotesDatabase extends FloorDatabase {
  NotesDao get notesDAO;
}