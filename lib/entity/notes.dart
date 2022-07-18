import 'package:floor/floor.dart';

@entity
class Notes{
  @PrimaryKey(autoGenerate: true)
  late int? id;

  String? title;
  String? body;
  String? created;
  String? updated;
  int? color;
  int? shape;
  String? reminder;

  Notes(
      {this.title,
        this.body,
        this.created,
        this.updated,
        this.color,
        this.shape,
        this.reminder
      });
}