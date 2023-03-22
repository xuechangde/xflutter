///倒计时返回格式化时间
class CountDown {
  String timeLeft(DateTime due,
      String finishedText,
      String daysTextLong,
      String hoursTextLong,
      String minutesTextLong,
      String secondsTextLong,
      String daysTextShort,
      String hoursTextShort,
      String minutesTextShort,
      String secondsTextShort,
      {bool? longDateName, bool? showLabel}) {
    String retVal = "";

    Duration timeUntilDue = due.difference(DateTime.now());

    int daysUntil = timeUntilDue.inDays;
    int hoursUntil = timeUntilDue.inHours - (daysUntil * 24);
    int minUntil =
        timeUntilDue.inMinutes - (daysUntil * 24 * 60) - (hoursUntil * 60);
    int secUntil = timeUntilDue.inSeconds - (minUntil * 60);
    // String s = _secUntil.toString().substring(_secUntil.toString().length - 2);
    // //Fixed Invalid Range Value
    String s = secUntil.toString().length <= 2
        ? secUntil.toString()
        : secUntil.toString().substring(secUntil.toString().length - 2);

    //Check whether to return longDateName date name or not
    if (showLabel == false){
      if (daysUntil > 9) {
        retVal += "$daysUntil : ";
      }else if(daysUntil > 0){
        retVal += "0$daysUntil : ";
      }
      if (hoursUntil > 9) {
        retVal += "$hoursUntil : ";
      }else if(hoursUntil > 0){
        retVal += "0$hoursUntil : ";
      }
      if (minUntil > 9) {
        retVal += "$minUntil : ";
      }else if(minUntil > 0){
        retVal += "0$minUntil : ";
      }
      if (secUntil > 9) {
        retVal += s;
      }else if(secUntil > 0){
        retVal += '0$s';
      }
    }else {
      if (longDateName == false) {
        if (daysUntil > 0) {
          retVal += daysUntil.toString() + daysTextShort;
        }
        if (hoursUntil > 0) {
          retVal += hoursUntil.toString() + hoursTextShort;
        }
        if (minUntil > 0) {
          retVal += minUntil.toString() + minutesTextShort;
        }
        if (secUntil > 0) {
          retVal += s + secondsTextShort;
        }
      } else {
        if (daysUntil > 0) {
          retVal += daysUntil.toString() + daysTextLong;
        }
        if (hoursUntil > 0) {
          retVal += hoursUntil.toString() + hoursTextLong;
        }
        if (minUntil > 0) {
          retVal += minUntil.toString() + minutesTextLong;
        }
        if (secUntil > 0) {
          retVal += s + secondsTextLong;
        }
      }
    }
    if(secUntil<1){
      retVal = finishedText;
    }
    return retVal;
  }
}