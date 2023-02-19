import 'package:get/get.dart';

import '../../common/common_index.dart';

class SplashState {
  ///用户是否进行隐私授权
  Rx<bool> isAgreement = SpService.to.getBool(SpKeyConst.kPrivacyAuthorization).obs;
  ///是否开始显示广告图
  Rx<bool> isShow = false.obs;
  ///广告倒计时
  Rx<int> count = 3.obs;
  ///是否开始广告倒计时播放
  Rx<bool> isStart = false.obs;

}
