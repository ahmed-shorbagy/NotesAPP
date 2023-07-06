import 'package:flutter/material.dart';
import 'package:points_counter/models/note.dart';
import 'colors_list.dart';
import 'constants.dart';

class EditNOteColorsList extends StatefulWidget {
  const EditNOteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNOteColorsList> createState() => _EditNOteColorsListState();
}

int currentindex = 0;

class _EditNOteColorsListState extends State<EditNOteColorsList> {
  @override
  void initState() {
    currentindex = kColorsList.indexOf(Color(widget.note.color!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentindex = index;
              widget.note.color = kColorsList[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: kColorsList[index],
              isActive: currentindex == index,
            ),
          );
        },
      ),
    );
  }
}
