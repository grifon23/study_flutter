import 'package:study_flutter/data/info_item_entity.dart';

class RemoteDataSource {
  Future<InfoItemEntity> getInfoItemData() async {
    await Future.delayed(Duration(seconds: 3));
    final List<InfoItemEntity> listData = [
      InfoItemEntity(DateTime.now(), "1", 'Item 1'),
      InfoItemEntity(DateTime.now(), "2", 'Item 2'),
      InfoItemEntity(DateTime.now(), "3", 'Item 3')
    ];
    // final respData = listData.singleWhere(((el) => el.id == id));
    return InfoItemEntity(DateTime.now(), "3", 'Item 3');
  }
}
