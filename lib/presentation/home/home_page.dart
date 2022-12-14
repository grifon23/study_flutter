
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/data/repository/app_local_data_source.dart';
import 'package:study_flutter/data/repository/app_repository_impl.dart';
import 'package:study_flutter/domain/model/item_model.dart';
import 'package:study_flutter/domain/repositories/app_repository.dart';
import 'package:study_flutter/domain/usecase/get_all_item_usecase.dart';
import 'package:study_flutter/presentation/home/home_bloc.dart';
import 'package:study_flutter/presentation/home/home_state.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) {
        final AppLocalDataSource appLocalDataSource = AppLocalDataSource();
        final AppRepository appRepository =
            AppRepositoryImpl(appLocalDataSource);
        final GetAllItemUsecase allItemUsecase =
            GetAllItemUsecase(appRepository);

        return HomeBloc(allItemUsecase)..getListItems();
      },
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is ListHomeState) {
              final List<TodoItem> list = state.listItems;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final TodoItem item = list[index];
                    return Container(
                      child: Row(
                        children: [
                          Text(item.title),
                          Spacer(),
                          Text(item.date.toString()),
                        ],
                      ),
                    );
                  });
            } else if (state is ErrorHomeState) {
              return Text(state.error);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
