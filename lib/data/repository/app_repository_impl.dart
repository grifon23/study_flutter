import 'package:study_flutter/data/entity/todo_item_entity.dart';
import 'package:study_flutter/data/repository/app_local_data_source.dart';
import 'package:study_flutter/domain/repositories/app_repository.dart';

//наслідування з доменного репозиторію і використання різних
// dataSuorce, його функції як параметру в AppRepositoryImpl

class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource localDataSource;

  AppRepositoryImpl(this.localDataSource);

  @override
  Future<List<TodoItemEntity>> getTodoList() {
    return localDataSource.getTodoItemData();
  }
}
