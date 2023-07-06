import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter/Cubits/notes_cubit/notes_cubit.dart';
import 'package:points_counter/Views/widgets/custom_Text_field.dart';
import 'package:points_counter/Views/widgets/custom_app_bar.dart';
import 'package:points_counter/Views/widgets/edit_note_colorslist.dart';

import 'package:points_counter/models/note.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: Column(
        children: [
          CustomAppBar(
            onpressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNOtes();
              Navigator.pop(context);
            },
            icon: Icons.done,
            title: 'Edit Note',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            initialValue: widget.note.title,
            onChanged: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            initialValue: widget.note.content,
            onChanged: (value) {
              content = value;
            },
            hint: 'content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          EditNOteColorsList(
            note: widget.note,
          )
        ],
      ),
    ));
  }
}
