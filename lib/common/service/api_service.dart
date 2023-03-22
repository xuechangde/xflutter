
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../res/strings.dart';
import '../base/base_resp.dart';
import '../http/request_api.dart';

class ApiService extends GetxService{
  static ApiService get to => Get.find();
  Future<ApiService> init() async {
    return this;
  }

  ///示例调用内部接口方法
  Future<String> getToken() async{
    EasyLoading.show(status:Ids.loading.tr);
    BaseResp? baseResp = await requestClientOther.getToken(2);
    EasyLoading.dismiss();
    if(baseResp!=null){
      if (0 == baseResp.code) {
        EasyLoading.showToast('');
        return baseResp.data;
      } else {
        EasyLoading.showError(baseResp.msg ?? Ids.unknownError.tr);
      }
    }
    return baseResp?.data;
  }

  ///示例调用第三方接口方法
  Future<dynamic> getTestData() async{
    var responseData = await requestClientOther.getTestData(2);
    if(responseData==null){
      return Future.error('调用第三方接口失败');
    }else{
      ///根据第三方平台数据结构和规则写相应逻辑，并返回需要的数据
      printInfo(info: '测试输出：$responseData');
      return responseData;
    }
  }
}