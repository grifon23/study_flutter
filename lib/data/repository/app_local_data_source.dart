import 'package:study_flutter/data/entity/todo_item_entity.dart';
import 'package:study_flutter/domain/model/item_model.dart';
//запит до бази
class AppLocalDataSource {
  Future<List<TodoItemEntity>> getTodoItemData() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      TodoItemEntity('1', 'Item 1', DateTime.now()),
      TodoItemEntity('2', 'Item 2', DateTime.now()),
      TodoItemEntity('3', 'Item 3', DateTime.now()),
    ];
  }
}
