import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:points_counter/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:points_counter/Cubits/notes_cubit/notes_cubit.dart';
import 'package:points_counter/simple_bloc_observer.dart';
import 'Views/Notes_view.dart';
import 'Views/widgets/constants.dart';
import 'models/note.dart';

void main() async {
  Bloc.observer = SimpleBLocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBOx);

  runApp(const NOtesApp());
}

class NOtesApp extends StatelessWidget {
  const NOtesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: NotesView(),
      ),
    );
  }
}
