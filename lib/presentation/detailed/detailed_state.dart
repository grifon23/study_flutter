import 'package:study_flutter/domain/model/item_info_model.dart';

abstract class DetailedState {}

class ErrorDetailedState implements DetailedState {
  final String error;

  ErrorDetailedState(this.error);
}

class LoadingDetailedState implements DetailedState {}

class InfoDetailedItemState implements DetailedState {
  final InfoItem infoItem;

  InfoDetailedItemState(this.infoItem);
}
