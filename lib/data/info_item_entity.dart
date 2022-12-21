import 'package:study_flutter/domain/model/item_info_model.dart';

class InfoItemEntity implements InfoItem {
  @override
  final DateTime date;

  @override
  final String id;

  @override
  final String title;

  InfoItemEntity(this.date, this.id, this.title);
}
