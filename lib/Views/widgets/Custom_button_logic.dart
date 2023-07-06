import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../Cubits/add_note_cubit/add_note_cubit.dart';
import '../../Cubits/notes_cubit/notes_cubit.dart';
import '../../models/note.dart';
import 'bottom_sheet_form.dart';
import 'constants.dart';
import 'custom_button.dart';

class CustomButtonLogic extends StatelessWidget {
  const CustomButtonLogic({
    super.key,
  });

  get state => null;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: state is AddNoteLoading ? true : false,
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          NoteModel note = NoteModel(
              title: title,
              content: content,
              date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
              color: kPrimaryColor.value);
          BlocProvider.of<AddNoteCubit>(context).addNOte(note);
          BlocProvider.of<NotesCubit>(context).fetchAllNOtes();
        } else {
          autovalidateMode = AutovalidateMode.always;
        }
      },
    );
  }
}
