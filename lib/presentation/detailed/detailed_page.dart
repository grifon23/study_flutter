import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/data/repository/info_repository_impl.dart';
import 'package:study_flutter/data/repository/remote_data_source.dart';
import 'package:study_flutter/domain/model/item_info_model.dart';
import 'package:study_flutter/domain/repositories/detailed_repository.dart';
import 'package:study_flutter/domain/usecase/get_info_item_usecase.dart';
import 'package:study_flutter/presentation/detailed/detailed_bloc.dart';
import 'package:study_flutter/presentation/detailed/detailed_state.dart';

class DetailedInfoPage extends StatelessWidget {
  const DetailedInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailedBloc>(
      create: (BuildContext context) {
        final RemoteDataSource remoteDataSource = RemoteDataSource();
        final DetailedRepository detailedRepository =
            InfoRepositiryImpl(remoteDataSource);
        final GetInfoItemUsecase getInfoItemUsecase =
            GetInfoItemUsecase(detailedRepository);

        return DetailedBloc(getInfoItemUsecase)..getInfoItem();
      },
      child: Scaffold(
        body:
            BlocBuilder<DetailedBloc, DetailedState>(builder: (context, state) {
          if (state is InfoDetailedItemState) {
            final InfoItem info = state.infoItem;
            return SafeArea(
                child: Container(
              child: Row(children: [
                Text(info.id),
                Text(info.title),
                Text(info.date.toString())
              ]),
            ));
          } else if (state is ErrorDetailedState) {
            return Text(state.error);
          }
          return CircularProgressIndicator();
        }),
      ),
    );
  }
}
