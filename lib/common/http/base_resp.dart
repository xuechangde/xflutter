
/// <BaseResp<T> 返回 status code msg data.
class BaseResp<T> {
  String? status;
  int? code;
  String? msg;
  T? data;

  BaseResp(this.status, this.code, this.msg, this.data);

  BaseResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['status'] = status;
    dataMap['code'] = code;
    dataMap['msg'] = msg;
    dataMap['data'] = data;
    return dataMap;
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}