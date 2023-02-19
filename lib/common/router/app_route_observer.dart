import 'package:flutter/cupertino.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'package:xflutter/common/global/global_bloc.dart';

class AppRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    notifyHide(previousRoute?.settings.name);
    notifyShow(route.settings.name);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    notifyHide(route.settings.name);
    notifyShow(previousRoute?.settings.name);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    notifyHide(oldRoute?.settings.name);
    notifyShow(newRoute?.settings.name);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    notifyHide(route.settings.name);
    notifyShow(previousRoute?.settings.name);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }

  void notifyShow(String? name) {
    if(name!=null){
      if (GlobalBloc.to.isAgreePrivacy) {
      UmengCommonSdk.onPageStart(name);
      }
    }

  }

  void notifyHide(String? name) {
    if(name!=null){
      if (GlobalBloc.to.isAgreePrivacy) {
      UmengCommonSdk.onPageEnd(name);
      }
    }
  }
}
