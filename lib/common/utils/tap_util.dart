
///防抖处理
Function() onTapDebounce(
    Function? func, {double bound =0.5}) {
  // ignore: prefer_function_declarations_over_variables
  Function() target = () {
    if(!FlashClick.isFlashClick(bound: bound)){
      func?.call();
    }
  };
  return target;
}

class FlashClick {
  /// 上次点击时间
  static DateTime? _lastTime;
  /// 检测是否为快速点击
  /// 参数 [bound] 检测点击时间间隔边界。单位是秒，[bound] 默认 0.5 秒
  static isFlashClick({double bound = 0.5}) {
    bool isFlash = false;
    ///时间差 大于 指定间隔边界值 非快速点击
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!).inMilliseconds.abs() >
            (bound * 1000).toInt()) {
      isFlash = false;
      _lastTime = DateTime.now();
    } else {
      isFlash = true;
    }
    return isFlash;
  }
}