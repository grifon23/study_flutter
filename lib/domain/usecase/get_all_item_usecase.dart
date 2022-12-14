import 'package:study_flutter/domain/model/item_model.dart';
import 'package:study_flutter/domain/repositories/app_repository.dart';

//  логіка для виклику репозиторія
class GetAllItemUsecase {
  final AppRepository appRepository;

  GetAllItemUsecase(this.appRepository);

  Future<List<TodoItem>> execute() async {
    final List<TodoItem> todolist = await appRepository.getTodoList();
    return todolist;
  }
}
