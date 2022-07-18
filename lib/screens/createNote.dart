import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/entity/notes.dart';
import 'package:untitled2/provider/note_provider.dart';

class CreateNote extends StatelessWidget {

  CreateNote({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

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
            onPressed: () => Provider.of<NoteProvider>(context, listen: false).insertNote(
              Notes(
                title: titleController.text,
                body: bodyController.text,
                created: DateTime.now().toString(),
              )
            ).then((value) => Navigator.of(context).pop()),
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
