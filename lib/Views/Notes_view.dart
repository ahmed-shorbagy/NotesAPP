import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:points_counter/Cubits/notes_cubit/notes_cubit.dart';
import 'package:points_counter/Views/widgets/add_note_bottom_sheet.dart';
import 'package:points_counter/Views/widgets/constants.dart';
import 'package:points_counter/Views/widgets/custom_app_bar.dart';
import 'package:points_counter/Views/widgets/notes_view_list.dart';
import 'package:points_counter/Views/widgets/search_widget.dart';
import 'package:points_counter/models/note.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNOtes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
        child: Column(
          children: [
            CustomAppBar(
              onpressed: () {
                showSearch<List<NoteModel>>(
                  context: context,
                  delegate: SearchWidget(Hive.box<NoteModel>(kNotesBOx)),
                );
              },
              title: 'Notes',
              icon: Icons.search,
            ),
            const Expanded(child: NOtesListView()),
          ],
        ),
      ),
    );
  }
}
