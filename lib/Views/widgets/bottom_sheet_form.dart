import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter/Cubits/add_note_cubit/add_note_cubit.dart';
import '../../models/note.dart';
import 'Custom_button_logic.dart';
import 'colors_list.dart';
import 'custom_Text_field.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({
    super.key,
  });

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title, content;
bool isLoading = false;
NoteModel? note;
Color selectedColor = Colors.blue;

class _BottomSheetFormState extends State<BottomSheetForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomTextFormField(
              onSaved: (value) {
                title = value;
              },
              hint: 'TItle',
            ),
          ),
          CustomTextFormField(
            onSaved: (value) {
              content = value;
            },
            hint: 'content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          const COlorsListView(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return const CustomButtonLogic();
            },
          )
        ],
      ),
    );
  }
}
