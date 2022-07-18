import 'package:flutter/material.dart';
import 'package:untitled2/dao/notes_dao.dart';
import 'package:untitled2/database/database.dart';
import 'package:untitled2/entity/notes.dart';

class NoteProvider extends ChangeNotifier{

  final List<Notes> data = [];
  late NotesDao dao;
  int color = 0x000000;
  bool colorSelected = false;

  NoteProvider(){
    initDao();
  }

  Future initDao() async{
    final database = await $FloorNotesDatabase.databaseBuilder('app_database.db').build();
    dao = database.notesDAO;
    data.addAll(await dao.getAllNotes());
    notifyListeners();
  }

  Future<void> insertNote(Notes notes) async{
    data.add(notes);
    notifyListeners();
    await dao.insertNote(notes);
  }

  Future<void> updateNote(Notes note, int index) async{
    data.removeAt(index);
    data.insert(index, note);
    notifyListeners();
    await dao.updateNote(note);
  }


}