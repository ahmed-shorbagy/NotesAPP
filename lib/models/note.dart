import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  int? color;
  @HiveField(3)
  String? date;

  NoteModel(
      {required this.color,
      required this.content,
      required this.date,
      required this.title});
}
