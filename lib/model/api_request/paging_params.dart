import 'dart:convert';

import '../../generated/json/base/json_field.dart';
import '../../generated/json/paging_params.g.dart';

@JsonSerializable()
class PagingParams {

  int pageNo = 1;
  Map<String, dynamic>? extra = {};
  Map<String, dynamic> model = {};
  String? order = 'descending';
  int size = 10;
  String? sort = "id";

  @JSONField(serialize: false)
  int? total;

  PagingParams();

  factory PagingParams.fromJson(Map<String, dynamic> json) => $PagingParamsFromJson(json);

  Map<String, dynamic> toJson() => $PagingParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  factory PagingParams.create({required int pageIndex, int pageSize = 10,Map<String, dynamic>? model}){
    var request = PagingParams();
    request.pageNo = pageIndex;
    request.size = pageSize;
    request.model = model ?? {};
    return request;
  }
}