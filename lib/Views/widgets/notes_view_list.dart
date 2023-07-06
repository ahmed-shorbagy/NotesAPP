import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:points_counter/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:points_counter/Cubits/notes_cubit/notes_cubit.dart';
import 'package:points_counter/Views/widgets/constants.dart';
import 'package:points_counter/models/note.dart';
import 'note_item.dart';

class NOtesListView extends StatefulWidget {
  const NOtesListView({super.key});

  @override
  State<NOtesListView> createState() => _NOtesListViewState();
}

class _NOtesListViewState extends State<NOtesListView> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
    final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: AnimatedList(
            key: listKey,
            initialItemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index, animation) {
              final note = notes[index];

              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: NoteItem(
                  onTrashIconPressed: () async {
                    if (notes.isNotEmpty &&
                        index >= 0 &&
                        index < notes.length) {
                      listKey.currentState!.removeItem(
                        index,
                        (context, animation) => NoteItem(
                          note: note,
                          animation: animation,
                        ),
                      );

                      // Remove the note from the list
                      notes.removeAt(index);

                      // Delete the note from Hive
                      await Hive.box<NoteModel>(kNotesBOx).delete(note.key);

                      BlocProvider.of<NotesCubit>(context).fetchAllNOtes();
                    }
                  },
                  note: note,
                  animation: animation,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
