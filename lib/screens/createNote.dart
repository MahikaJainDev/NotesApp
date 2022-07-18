import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            icon: const Icon(Icons.check_rounded),
            onPressed: () => Provider.of<NoteProvider>(context, listen: false)
                .insertNote(Notes(
                    title: titleController.text,
                    body: bodyController.text,
                    created: DateTime.now().toString(),
                    updated: DateTime.now().toString()))
                .then((value) => Navigator.of(context).pop()),
          )
        ],
      ),
      body: Column(
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
                    'Edited: ${DateFormat("jm").format(DateTime.parse(DateTime.now().toString()))}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
