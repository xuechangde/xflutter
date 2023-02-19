
/// id card province dict.
List<String> ID_CARD_PROVINCE_DICT = [
  '11=北京',
  '12=天津',
  '13=河北',
  '14=山西',
  '15=内蒙古',
  '21=辽宁',
  '22=吉林',
  '23=黑龙江',
  '31=上海',
  '32=江苏',
  '33=浙江',
  '34=安徽',
  '35=福建',
  '36=江西',
  '37=山东',
  '41=河南',
  '42=湖北',
  '43=湖南',
  '44=广东',
  '45=广西',
  '46=海南',
  '50=重庆',
  '51=四川',
  '52=贵州',
  '53=云南',
  '54=西藏',
  '61=陕西',
  '62=甘肃',
  '63=青海',
  '64=宁夏',
  '65=新疆',
  '71=台湾老',
  '81=香港',
  '82=澳门',
  '83=台湾新',
  '91=国外',
];

/// Regex Util.
class RegexUtil {
  /// 简单手机号码正则表达式.
  static const String regexMobileSimple = '^[1]\\d{10}\$';

  /// 精确手机号码的正则表达式.
  ///  <p>china mobile: 134(0-8), 135, 136, 137, 138, 139, 147, 150, 151, 152, 157, 158, 159, 165, 172, 178, 182, 183, 184, 187, 188, 195, 198</p>
  ///  <p>china unicom: 130, 131, 132, 145, 155, 156, 166, 167, 171, 175, 176, 185, 186</p>
  ///  <p>china telecom: 133, 153, 162, 173, 177, 180, 181, 189, 199, 191</p>
  ///  <p>global star: 1349</p>
  ///  <p>virtual operator: 170</p>
  static const String regexMobileExact =
      '^((13[0-9])|(14[57])|(15[0-35-9])|(16[2567])|(17[01235-8])|(18[0-9])|(19[1589]))\\d{8}\$';

  /// 电话号码的正则表达式.
  static const String regexTel = '^0\\d{2,3}[- ]?\\d{7,8}';

  /// 长度为15的身份证卡号的表达式
  static const String regexIdCard15 =
      '^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$';

  /// 长度为18的身份证卡号的表达式.
  static const String regexIdCard18 =
      '^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])\$';

  /// 电子邮件的正则表达式.
  static const String regexEmail =
      '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$';

  /// url的正则表达式.
  static const String regexUrl = '[a-zA-Z]+://[^\\s]*';

  /// 汉字正则表达式.
  static const String regexZh = '[\\u4e00-\\u9fa5]';

  /// 日期的正则表达式，哪个模式是'yyyy-MM-dd'.
  static const String regexDate =
      '^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)\$';

  /// ip地址的正则表达式.
  static const String regexIp =
      '((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)';

  /// 必须包含字母和数字, 6~18.
  static const String regexUsername =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)[0-9A-Za-z]{6,18}\$';

  /// 必须包含字母和数字,可包含特殊字符 6~18.
  static const String regexUsername2 =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)[0-9A-Za-z\\W]{6,18}\$';

  /// 必须包含字母和数字和殊字符, 6~18.
  static const String regexUsername3 =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)(?![0-9a-zA-Z]+\$)(?![0-9\\W]+\$)(?![a-zA-Z\\W]+\$)[0-9A-Za-z\\W]{6,18}\$';

  /// QQ号码的正则表达式.
  static const String regexQQ = '[1-9][0-9]{4,}';

  /// 中国邮政编码正则表达式.
  static const String regexChinaPostalCode = "[1-9]\\d{5}(?!\\d)";

  /// 护照的正则表达式.
  static const String regexPassport =
      r'(^[EeKkGgDdSsPpHh]\d{8}$)|(^(([Ee][a-fA-F])|([DdSsPp][Ee])|([Kk][Jj])|([Mm][Aa])|(1[45]))\d{7}$)';

  static final Map<String, String> cityMap = {};

  ///返回输入是否匹配简单移动的正则表达式.
  static bool isMobileSimple(String input) {
    return matches(regexMobileSimple, input);
  }

  ///返回输入是否匹配精确移动的正则表达式.
  static bool isMobileExact(String input) {
    return matches(regexMobileExact, input);
  }

  ///返回输入是否与电话号码的正则表达式匹配.
  static bool isTel(String input) {
    return matches(regexTel, input);
  }

  /// 返回输入是否与身份证卡号的正则表达式匹配.
  static bool isIDCard(String input) {
    if (input.length == 15) {
      return isIDCard15(input);
    }
    if (input.length == 18) {
      return isIDCard18Exact(input);
    }
    return false;
  }

  ///返回输入是否与长度为15的身份证卡号的正则表达式匹配.
  static bool isIDCard15(String input) {
    return matches(regexIdCard15, input);
  }

  ///返回输入是否与长度为18的身份证卡号的正则表达式匹配.
  static bool isIDCard18(String input) {
    return matches(regexIdCard18, input);
  }

  ///返回输入是否与长度为18的精确身份卡号的正则表达式匹配.
  static bool isIDCard18Exact(String input) {
    if (isIDCard18(input)) {
      List<int> factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
      List<String> suffix = [
        '1',
        '0',
        'X',
        '9',
        '8',
        '7',
        '6',
        '5',
        '4',
        '3',
        '2'
      ];
      if (cityMap.isEmpty) {
        List<String> list = ID_CARD_PROVINCE_DICT;
        List<MapEntry<String, String>> mapEntryList = [];
        for (int i = 0, length = list.length; i < length; i++) {
          List<String> tokens = list[i].trim().split('=');
          MapEntry<String, String> mapEntry = MapEntry(tokens[0], tokens[1]);
          mapEntryList.add(mapEntry);
        }
        cityMap.addEntries(mapEntryList);
      }
      if (cityMap[input.substring(0, 2)] != null) {
        int weightSum = 0;
        for (int i = 0; i < 17; ++i) {
          weightSum += (input.codeUnitAt(i) - '0'.codeUnitAt(0)) * factor[i];
        }
        int idCardMod = weightSum % 11;
        String idCardLast = String.fromCharCode(input.codeUnitAt(17));
        return idCardLast == suffix[idCardMod];
      }
    }
    return false;
  }

  ///返回输入是否匹配电子邮件的正则表达式.
  static bool isEmail(String input) {
    return matches(regexEmail, input);
  }

  ///返回输入是否匹配url的正则表达式.
  static bool isURL(String input) {
    return matches(regexUrl, input);
  }

  ///返回输入是否匹配中文字符的正则表达式.
  static bool isZh(String input) {
    return '〇' == input || matches(regexZh, input);
  }

  ///返回输入是否匹配日期的正则表达式，该模式为'yyyy-MM-dd'.
  static bool isDate(String input) {
    return matches(regexDate, input);
  }

  ///返回输入是否与ip地址的正则表达式匹配.
  static bool isIP(String input) {
    return matches(regexIp, input);
  }

  ///返回输入是否与用户名的正则表达式匹配.
  static bool isUserName(String input, {String regex = regexUsername}) {
    return matches(regex, input);
  }

  ///返回输入是否匹配QQ的正则表达式.
  static bool isQQ(String input) {
    return matches(regexQQ, input);
  }

  ///返回输入是否与Passport的正则表达式匹配.
  static bool isPassport(String input) {
    return matches(regexPassport, input);
  }

  ///自定义正则
  static bool matches(String regex, String input) {
    if (input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }
}
