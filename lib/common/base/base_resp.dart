
/// <BaseResp<T> 返回 status code msg data.
class BaseResp<T> {
  int? code;
  String? msg;
  T? data;

  BaseResp(this.code, this.msg, this.data);

  BaseResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['code'] = code;
    dataMap['msg'] = msg;
    dataMap['data'] = data;
    return dataMap;
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}