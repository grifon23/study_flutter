import 'package:study_flutter/domain/model/item_info_model.dart';

abstract class DetailedRepository {
  Future<InfoItem> getInfoItem();
}
