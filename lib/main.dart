import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'common/app_config.dart';
import 'common/common_index.dart';
import 'common/global/global_bloc.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    final easyLoadingBuilder = EasyLoading.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      builder: (ctx, child) {
        ScreenUtil.init(ctx, designSize: const Size(750, 1624));
        child = botToastBuilder(ctx, child);
        child = easyLoadingBuilder(ctx,child);
        return child;
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: Strings(),
      locale: const Locale('zh', 'CN'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeConfig.themeData(),
      darkTheme: ThemeConfig.themeData(platformDarkMode: true),
      getPages: AppPages.pages(),
      initialRoute: AppRoutes.initial,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      routingCallback: (routing){
        if(routing!=null&&GlobalBloc.to.isAgreePrivacy&&routing.current!=AppRoutes.initial){
          if(routing.previous.isNotEmpty&&routing.previous!=AppRoutes.initial){
            UmengCommonSdk.onPageEnd(routing.previous);
          }
          if(routing.current.isNotEmpty){
            UmengCommonSdk.onPageStart(routing.current);
          }
        }
      },
    );
  }
}
