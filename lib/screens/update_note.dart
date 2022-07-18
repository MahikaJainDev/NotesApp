import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/entity/notes.dart';
import 'package:untitled2/provider/note_provider.dart';

class UpdateNoteRoute extends StatelessWidget {

  final Notes note;
  final int index;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  UpdateNoteRoute({super.key, required this.note, required this.index}){
    titleController.text = note.title ?? '';
    bodyController.text = note.body ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.check_rounded
            ),
            onPressed: () async{
              note.title = titleController.text;
              note.body = bodyController.text;
              await Provider.of<NoteProvider>(context, listen: false).updateNote(
                  note,
                  index
              );
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: bodyController,
          )
        ],
      ),
    );
  }
}
