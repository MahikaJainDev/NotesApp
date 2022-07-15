import 'package:floor/floor.dart';

@entity
class Notes{
  @PrimaryKey(autoGenerate: true)
  late final int id;

  String? note;

  Notes(this.id, this.note);
}