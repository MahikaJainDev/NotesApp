import 'package:floor/floor.dart';

@entity
class Notes{
  @PrimaryKey(autoGenerate: true)
  late int? id;

  final String? title;
  final String? body;
  final String? created;
  final String? updated;
  final int? color;
  final int? shape;
  final String? reminder;

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