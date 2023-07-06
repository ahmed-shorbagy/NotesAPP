import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubits/notes_cubit/notes_cubit.dart';
import '../../models/note.dart';
import 'custom_Text_field.dart';

class NoteResultPage extends StatefulWidget {
  final NoteModel note;

  NoteResultPage({required this.note});

  @override
  State<NoteResultPage> createState() => _NoteResultPageState();
}

String? content;

class _NoteResultPageState extends State<NoteResultPage> {
  @override
  Widget build(BuildContext context) {
    // Implement the UI to display the note details
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16)),
              child: IconButton(
                  onPressed: () {
                    widget.note.content = content ?? widget.note.content;
                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNOtes();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    size: 24,
                    Icons.done,
                    color: Colors.black,
                  )),
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(widget.note.color!),
        centerTitle: true,
        title: Text(
          widget.note.title!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Card(
              child: Text(
                'Edit Content',
                style: TextStyle(fontSize: 32),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              onChanged: (value) {
                content = value;
              },
              hint: 'content',
              initialValue: widget.note.content,
              maxlines: 16,
            ),
          ],
        ),
      )),
    );
  }
}
