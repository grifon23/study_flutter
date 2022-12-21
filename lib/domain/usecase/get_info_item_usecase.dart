import 'package:study_flutter/data/repository/info_repository_impl.dart';
import 'package:study_flutter/domain/model/item_info_model.dart';
import 'package:study_flutter/domain/repositories/detailed_repository.dart';

class GetInfoItemUsecase {
  final DetailedRepository detailedRepository;

  GetInfoItemUsecase(this.detailedRepository);

  Future<InfoItem> execute() async {
    final InfoItem info = await detailedRepository.getInfoItem();

    return info;
  }
}
