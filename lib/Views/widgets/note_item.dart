import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:points_counter/models/note.dart';
import '../EditNoteView.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
    this.onPressed,
    this.onTrashIconPressed,
    required this.animation,
  }) : super(key: key);

  final NoteModel note;
  final void Function()? onPressed;
  final void Function()? onTrashIconPressed;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
            },
          ),
        );
      },
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation!),
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color!),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  trailing: IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                    ),
                    onPressed: onTrashIconPressed,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      '${note.content}',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  title: Text(
                    '${note.title}',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    '${note.date}',
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
