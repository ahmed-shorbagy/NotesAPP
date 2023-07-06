import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:points_counter/Views/widgets/constants.dart';
import 'package:points_counter/models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNOtes() {
    var notesBox = Hive.box<NoteModel>(kNotesBOx);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
