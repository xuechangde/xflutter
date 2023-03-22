import 'package:get/get.dart';
import '../common_index.dart';

class GlobalState {
  var themeColor = (UiColors.themeColorSupport.keys.toList()[
  SpService.to.getInt(SpKeyConst.kThemeColorIndex)]).obs;
  bool isAgreePrivacy = SpService.to.getBool(SpKeyConst.kPrivacyAuthorization);
  bool isLogin = SpService.to.getString(SpKeyConst.kAppToken).isNotEmpty;
  String token = SpService.to.getString(SpKeyConst.kAppToken);
  String cookie = SpService.to.getString(SpKeyConst.kAppCookie);
}