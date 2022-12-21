import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/domain/model/item_info_model.dart';
import 'package:study_flutter/domain/usecase/get_info_item_usecase.dart';
import 'package:study_flutter/presentation/detailed/detailed_state.dart';

class DetailedBloc extends Cubit<DetailedState> {
  DetailedBloc(this.getInfoItemUsecase) : super(LoadingDetailedState());

  final GetInfoItemUsecase getInfoItemUsecase;

  Future<void> getInfoItem() async {
    try {
      emit(LoadingDetailedState());
      final InfoItem infoItem = await getInfoItemUsecase.execute();
      emit(InfoDetailedItemState(infoItem));
    } catch (e) {
      emit(ErrorDetailedState('$e'));
    }
  }
}
