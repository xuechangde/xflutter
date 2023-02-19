import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'package:xflutter/common/app_config.dart';
import '../http/dio_utils.dart';
import '../service/api_service.dart';
import '../service/sp_service.dart';
import '../utils/method_channel_util.dart';
import 'global_bloc.dart';

class Global {
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    setSystemUi();
    await Get.putAsync<SpService>(() => SpService().init());
    await Get.putAsync<GlobalBloc>(() => GlobalBloc().init());
    await Get.putAsync<ApiService>(() => ApiService().init());
    await Get.putAsync<DioUtil>(() => DioUtil().init());
    await setAppConfig();
    initThirdSdk();
  }
  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        // systemNavigationBarDividerColor: Colors.transparent,
        // systemNavigationBarColor: Colors.white,
        // systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  ///初始化第三方相关
  static void initThirdSdk() async{
    registerWxApi(appId: AppConfig.wxAppId, universalLink: AppConfig.universalLink);
    if (GlobalBloc.to.isAgreePrivacy) {
      await UmengCommonSdk.initCommon(AppConfig.umAndroidAppKey,AppConfig.umIosAppKey,AppConfig.channelName);
      UmengCommonSdk.setPageCollectionModeManual();
    }
  }

  ///初始化设置相关配置值
  static Future setAppConfig() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AppConfig.versionName = packageInfo.version;
    AppConfig.channelName = await MethodChannelUtil.getChannelName();
    const platform = MethodChannel('flutter/method');
    platform.setMethodCallHandler(MethodChannelUtil.flutterMethod);
    ///设置网络请求配置
    BaseOptions options = DioUtil.getDefOptions();
    if (GlobalBloc.to.cookie.isNotEmpty) {
      Map<String, dynamic> headers = {};
      headers["Cookie"] = GlobalBloc.to.cookie;
      options.headers = headers;
    }
    HttpConfig config = HttpConfig(options: options);
    DioUtil.to.setConfig(config);
    if(GlobalBloc.to.token.isNotEmpty){
      DioUtil.to.setTokenInterceptors();
    }
  }
}