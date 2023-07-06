part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFaliure extends AddNoteState {
  final String errMessage;
  AddNoteFaliure({required this.errMessage});
}

class DeleteNoteSuccess extends AddNoteState {}

class DeleteNOteFaliure extends AddNoteState {
  final String errMessage;
  DeleteNOteFaliure({required this.errMessage});
}
