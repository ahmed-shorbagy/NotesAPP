import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter/Cubits/add_note_cubit/add_note_cubit.dart';

import 'constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: CircleAvatar(
                radius: 36,
                backgroundColor: color,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          );
  }
}

class COlorsListView extends StatefulWidget {
  const COlorsListView({super.key});

  @override
  State<COlorsListView> createState() => _COlorsListViewState();
}

class _COlorsListViewState extends State<COlorsListView> {
  int currentindex = 0;

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
              BlocProvider.of<AddNoteCubit>(context).color = kColorsList[index];
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
