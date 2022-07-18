import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/provider/note_provider.dart';
import 'package:untitled2/screens/allNotesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteProvider>(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'My Notes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AllNotesScreen(),
      ),
    );
  }
}