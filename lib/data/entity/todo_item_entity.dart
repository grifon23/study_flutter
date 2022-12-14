import 'package:study_flutter/domain/model/item_model.dart';

class TodoItemEntity implements TodoItem {
  @override
  final String id;

  @override
  final String title;

  @override
  final DateTime date;

  TodoItemEntity(this.id, this.title, this.date);
}
