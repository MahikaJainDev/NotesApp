import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/entity/notes.dart';
import 'package:untitled2/provider/note_provider.dart';
import 'package:intl/intl.dart';

class UpdateNoteRoute extends StatefulWidget {
  final Notes note;
  final int index;

  UpdateNoteRoute({super.key, required this.note, required this.index});

  @override
  State<UpdateNoteRoute> createState() => _UpdateNoteRouteState();
}

class _UpdateNoteRouteState extends State<UpdateNoteRoute> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  int? color;

  @override
  void initState() {
    titleController.text = widget.note.title ?? '';
    bodyController.text = widget.note.body ?? '';
    color = widget.note.color;
    super.initState();
  }

  bool colorSelected = false;
  List<int> mColors = [
    0x00000000, //transparent
    0xFFEF9A9A, //RED[200]
    0xFFFFAB40, //ORANGEACCENT
    0xFFFFEB3B, //YELLOW[500]
    0xFF00E676, //GREENACCENT[400]
    0xffa5d6a7, //green[200]
    0xffce93d8, //purple[200]
    0xff90a4ae, //blueGrey[300]
    0xfff06292, //pink[300]
    0xffb2ff59, //lightGreenAccent
    0xff4db6a6, //teal[300]
    0xff81d4fa //lightBlue[200]
  ];

  setColor(int ncolor) {
    if (colorSelected == false) {
      setState(() {
        color = 0x00000000;
      });
    }
    setState(() {
      color = ncolor;
    });
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
              widget.note.title = titleController.text;
              widget.note.body = bodyController.text;
              widget.note.updated = DateTime.now().toString();
              widget.note.color = color;
              await Provider.of<NoteProvider>(context, listen: false)
                  .updateNote(widget.note, widget.index);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        color: colorSelected == true
            ? Color(color!)
            : widget.note.color == null
                ? const Color(0x00000000)
                : Color(widget.note.color!),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: TextField(
                controller: titleController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.w400),
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
                  hintStyle:
                      TextStyle(fontSize: 16.0, color: Color(0xff999999)),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            constraints: BoxConstraints(
                              maxHeight: 70.0,
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                            builder: (context) => Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: mColors.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(mColors[i]),
                                            border: Border.all(
                                                color: const Color(0xff999999)),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            colorSelected = true;
                                            setColor(mColors[i]);
                                          });

                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                        icon: const Icon(Icons.palette_outlined)),
                    Text(
                        'Edited: ${DateFormat("jm").format(DateTime.parse(DateTime.now().toString()))}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
