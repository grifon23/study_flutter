import 'package:study_flutter/domain/model/item_model.dart';

//список функцій які необхідні для роботи з данними. Тільки назви фн і типи респонса
abstract class AppRepository {
  Future<List<TodoItem>> getTodoList();
}