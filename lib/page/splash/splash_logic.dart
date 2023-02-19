import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../../common/common_index.dart';
import '../../widget/dialog/privacy_policy_dialog.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();
  final TapGestureRecognizer _userProtocolRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _privacyProtocolRecognizer = TapGestureRecognizer();
  ///启动图展示倒计时
  final TimerUtil _launchTimer = TimerUtil(mTotalTime: 2 * 1000);
  ///广告倒计时
  final TimerUtil _timerUtil = TimerUtil(mTotalTime: 3 * 1000);

  @override
  void onReady(){
    if(!state.isAgreement.value){
      Get.dialog(PrivacyPolicyDialog(_userProtocolRecognizer, _privacyProtocolRecognizer)).then((value){
        state.isAgreement.value = value;
        state.isShow.value = true;
        _userProtocolRecognizer.dispose();
        _privacyProtocolRecognizer.dispose();
      });
    }else{
      doLaunchCountDown();
    }
    super.onReady();
  }

  ///启动图倒计时
  void doLaunchCountDown() {
    _launchTimer.setOnTimerTickCallback((int value) {
      double tick = value / 1000;
      if (tick.toInt() == 0) {
        ///等于0的时候开始展示广告图
        _launchTimer.cancel();
        state.isShow.value = true;
      }
    });
    _launchTimer.startCountDown();
  }

  ///开始广告计时
  void doCountDown() {
    _timerUtil.setOnTimerTickCallback((int value) {
      double tick = value / 1000;
      state.count.value = tick.toInt();
      if (tick.toInt() == 0) {
        ///等于0的时候跳转主页
        _timerUtil.cancel();
      }
    });
    _timerUtil.startCountDown();
  }

  @override
  void dispose() {
    super.dispose();
    _timerUtil.cancel();
  }
}
