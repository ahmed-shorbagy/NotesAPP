import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:points_counter/Views/widgets/snack_bar.dart';
import 'bottom_sheet_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
        if (state is AddNoteFaliure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
            child: AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const BottomSheetForm(),
          ),
        ));
      },
    );
  }
}
