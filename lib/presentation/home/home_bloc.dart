import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/domain/model/item_model.dart';
import 'package:study_flutter/domain/usecase/get_all_item_usecase.dart';
import 'package:study_flutter/presentation/home/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this.getAllItemUsecase) : super(LoadingHomeState());

  final GetAllItemUsecase getAllItemUsecase;

  Future<void> getListItems() async {
    try {
      emit(LoadingHomeState());
      final List<TodoItem> list = await getAllItemUsecase.execute();
      emit(ListHomeState(list));
    } catch (e) {
      emit(ErrorHomeState('$e'));
    }
  }
}
