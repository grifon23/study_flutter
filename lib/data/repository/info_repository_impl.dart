import 'package:study_flutter/data/repository/remote_data_source.dart';
import 'package:study_flutter/domain/model/item_info_model.dart';
import 'package:study_flutter/domain/repositories/detailed_repository.dart';

class InfoRepositiryImpl implements DetailedRepository {
  final RemoteDataSource remoteDataSource;
  InfoRepositiryImpl(this.remoteDataSource);

  @override
  Future<InfoItem> getInfoItem() {
    return remoteDataSource.getInfoItemData();
  }
}
