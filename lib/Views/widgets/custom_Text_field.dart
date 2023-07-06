import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.maxlines = 1,
      this.onSaved,
      this.onChanged,
      this.initialValue});
  final String hint;
  final int maxlines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'this field is requiered';
          } else {
            return null;
          }
        },
        maxLines: maxlines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kPrimaryColor),
            focusedBorder: buildBorder(kPrimaryColor),
            border: buildBorder(),
            enabledBorder: buildBorder()),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius: BorderRadius.circular(12));
  }
}
