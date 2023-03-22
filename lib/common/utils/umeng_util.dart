import 'package:umeng_common_sdk/umeng_common_sdk.dart';

///友盟方法类
class UmengUtil{
  ///友盟登录
  static void umLogin(){
    UmengCommonSdk.onProfileSignIn('userId');
  }
  ///退出友盟登录
  static void umLoginOut(){
    UmengCommonSdk.onProfileSignOff();
  }

  ///@description TODO 发送友盟自定义事件
  ///@param 方法名称，传递参数
  ///@return
  ///@updateTime 2023/3/7 18:28
  ///@author Xcd
  static void customUmEvent(String eventName,Map<String,dynamic> properties){
    UmengCommonSdk.onEvent(eventName,properties);
    umLoginOut();
    umLogin();
  }
}

class CustomUmEventName{
  ///登录
  static String login = '__login';
  ///注册
  static String register = '__register';
  ///提交订单
  static String submitPayment = '__submit_payment';
  ///完成支付
  static String finishPayment = '__finish_payment';
}