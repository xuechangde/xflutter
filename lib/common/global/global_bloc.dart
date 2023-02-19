import 'package:get/get.dart';
import 'global_state.dart';

class GlobalBloc extends GetxController{
  GlobalBloc();
  static GlobalBloc get to => Get.find();
  Future<GlobalBloc> init() async {
    return this;
  }
  final GlobalState globalState = GlobalState();
  set themeColor(var color){
    globalState.themeColor.value = color;
  }
  ///获取主题色
  get themeColor => globalState.themeColor.value;
  ///是否同意隐私协议
  get isAgreePrivacy => globalState.isAgreePrivacy;
  ///是否登录
  get isLogin => globalState.isLogin;
  ///获取token
  get token => globalState.token;
  ///获取cookie
  get cookie => globalState.cookie;
}