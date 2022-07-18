import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/entity/notes.dart';
import 'package:untitled2/provider/note_provider.dart';
import 'package:intl/intl.dart';

class UpdateNoteRoute extends StatelessWidget {
  final Notes note;
  final int index;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  UpdateNoteRoute({super.key, required this.note, required this.index}) {
    titleController.text = note.title ?? '';
    bodyController.text = note.body ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () async {
              note.title = titleController.text;
              note.body = bodyController.text;
              note.updated = DateTime.now().toString();
              await Provider.of<NoteProvider>(context, listen: false)
                  .updateNote(note, index);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        color: Color(note.color!),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: TextField(
                controller: titleController,
                textInputAction: TextInputAction.next,
                style:
                    const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xff999999),
                      fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: TextField(
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Note',
                  hintStyle: TextStyle(fontSize: 16.0, color: Color(0xff999999)),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      'Edited: ${DateFormat("d MMMM yyyy").format(DateTime.parse(note.updated!))}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
