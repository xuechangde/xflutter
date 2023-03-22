
import 'package:xflutter/model/api_response/paging_data.dart';

import '../../generated/json/base/json_convert_content.dart';

PagingData<T> $PagingDataFromJson<T>(Map<String, dynamic> json) {
  final PagingData<T> pagingData = PagingData<T>();
  final int? current = jsonConvert.convert<int>(json['current_page']);
  if (current != null) {
    pagingData.currentPage = current;
  }
  final bool? hitCount = jsonConvert.convert<bool>(json['hitCount']);
  if (hitCount != null) {
    pagingData.hitCount = hitCount;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    pagingData.pages = pages;
  }
  final List<T>? records = jsonConvert.convertListNotNull<T>(json['data']);
  if (records != null) {
    pagingData.data = records;
  }
  final bool? searchCount = jsonConvert.convert<bool>(json['searchCount']);
  if (searchCount != null) {
    pagingData.searchCount = searchCount;
  }
  final int? size = jsonConvert.convert<int>(json['per_page']);
  if (size != null) {
    pagingData.perPage = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    pagingData.total = total;
  }
  return pagingData;
}

Map<String, dynamic> $PagingDataToJson(PagingData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['current_page'] = entity.currentPage;
  data['hitCount'] = entity.hitCount;
  data['pages'] = entity.pages;
  data['records'] =  entity.data;
  data['searchCount'] = entity.searchCount;
  data['per_page'] = entity.perPage;
  data['total'] = entity.total;
  return data;
}