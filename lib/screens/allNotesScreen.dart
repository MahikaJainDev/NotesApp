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
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: provider.data.map((eachNote){
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey)
                ),
                  child: Column(
                    children: [
                      Text(eachNote.title ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Text(eachNote.body ?? '')
                    ],
                  ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateNoteRoute(
                        note: eachNote,
                        index: provider.data.indexOf(eachNote),
                      ),
                  ),
              )
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
