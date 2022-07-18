import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/provider/note_provider.dart';
import 'package:untitled2/screens/createNote.dart';
import 'package:untitled2/screens/update_note.dart';

class AllNotesScreen extends StatelessWidget {
  const AllNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('All Notes'),
        ),
        body: StaggeredGrid.count(
          crossAxisCount: 4,
          children: provider.data.map((eachNote){
            return Row(
              children: [
                Expanded(
                  child: Text(eachNote.title ?? ''),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => UpdateNoteRoute(
                        note: eachNote,
                        index: provider.data.indexOf(eachNote)
                      )
                    )
                  ),
                  icon: const Icon(
                    Icons.edit_rounded
                  )
                )
              ],
            );
          }).toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNote()
            )
          ),
        ),
      ),
    );
  }
}
