import 'dart:convert';
import 'package:xflutter/model/api_response/paging_data_helper.dart';
class PagingData<T> {

  int? currentPage;
  bool? hitCount;
  int? pages;
  List<T>? data;
  bool? searchCount;
  int? perPage;
  int? total;

  PagingData();

  factory PagingData.fromJson(Map<String, dynamic> json) => $PagingDataFromJson<T>(json);

  Map<String, dynamic> toJson() => $PagingDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

}