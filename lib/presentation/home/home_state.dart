import 'package:study_flutter/domain/model/item_model.dart';

abstract class HomeState {}

class ErrorHomeState implements HomeState {
  final String error;

  ErrorHomeState(this.error);
}

class LoadingHomeState implements HomeState {}

class ListHomeState implements HomeState {
  final List<TodoItem> listItems;

  ListHomeState(this.listItems);
}
