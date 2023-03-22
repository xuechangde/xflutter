
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

///权限申请工具类
class PermissionUtil {
  /// 检测是否有权限
  /// [permissionList] 权限申请列表
  /// [onSuccess] 全部成功
  /// [onFailed] 有一个失败
  /// [goSetting] 前往设置 插件虽然提供了一个跳转设置的方法不过也可以自定义
  /// [permissionDescription] 权限描述
  static checkPermission(
      {required List<Permission> permissionList,
        VoidCallback? onSuccess,
        VoidCallback? onFailed,
        VoidCallback? goSetting,
        String? permissionDescription,}) async {
    ///一个新待申请权限列表
    List<Permission> newPermissionList = [];

    ///遍历当前权限申请列表
    for (Permission permission in permissionList) {
      PermissionStatus status = await permission.status;

      ///如果不是允许状态就添加到新的申请列表中
      if (!status.isGranted) {
        newPermissionList.add(permission);
      }
    }

    ///如果需要重新申请的列表不是空的
    if (newPermissionList.isNotEmpty) {
      PermissionStatus permissionStatus =
      await requestPermission(newPermissionList);
      switch (permissionStatus) {
      ///拒绝状态
        case PermissionStatus.denied:
          onFailed != null ? onFailed() : (){};
          break;
      ///允许状态
        case PermissionStatus.granted:
          onSuccess != null ? onSuccess() : (){};
          break;
      /// 永久拒绝  活动限制
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.permanentlyDenied:
          goSetting != null
              ? goSetting()
              : openAppSettings();
          break;
      }
    } else {
      onSuccess != null ? onSuccess() : (){};
    }
  }

  /// 获取新列表中的权限 如果有一项不合格就返回false
  static requestPermission(List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }

  ///检查位置权限
  static checkLocationAlways(
      {VoidCallback? onSuccess,
        VoidCallback? onFailed,
        VoidCallback? goSetting}) async {
    ///获取前置状态
    /// Android没有这一步 ios会先访问这个再访问其他的
    PermissionStatus status = PermissionStatus.granted;
    status = await _checkSinglePermission(Permission.locationWhenInUse);
    ///获取第二个状态
    PermissionStatus status2 = PermissionStatus.denied;
    ///如果前置状态为成功才能执行获取第二个状态
    if (status.isGranted) {
      status2 = await _checkSinglePermission(Permission.locationAlways);
    }
    ///如果两个都成功那么就返回成功
    if (status.isGranted && status2.isGranted) {
      onSuccess != null ? onSuccess() : (){};
      ///如果有一个拒绝那么就失败了
    } else if (status.isDenied || status2.isDenied) {
      onFailed != null ? onFailed() : (){};
    } else {
      goSetting != null ? goSetting() : await openAppSettings();
    }
  }
  static _checkSinglePermission(Permission permission) async {
    ///获取当前状态
    PermissionStatus status = await permission.status;
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    ///如果它状态不是允许那么就去获取
    if (!status.isGranted) {
      currentPermissionStatus = await requestPermission([permission]);
    }
    ///返回最终状态
    return currentPermissionStatus;
  }
}