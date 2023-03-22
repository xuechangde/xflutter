import 'package:get/get.dart';

class Ids {
  ///温馨提示
  static const String warmPrompt = 'warm_prompt';

  ///请您在阅读本产品之前仔细阅读
  static const String agreementContent1 = 'agreement_content1';

  ///《用户协议》
  static const String agreementContent2 = 'agreement_content2';

  ///与
  static const String agreementContent3 = 'agreement_content3';

  ///《隐私协议》
  static const String agreementContent4 = 'agreement_content4';

  ///我们一向尊重并会...
  static const String agreementContent5 = 'agreement_content5';

  ///不同意
  static const String disagree = 'disagree';

  ///同意
  static const String agree = 'agree';

  ///跳过
  static const String jumpCount = 'jump_count';

  ///数据解析异常
  static const String dataParsingException = 'dataParsingException';

  ///错误码
  static const String errorCode = 'errorCode';

  ///400
  static const String errorCode400 = '400';
  ///401
  static const String errorCode401 = '401';
  ///403
  static const String errorCode403 = '403';
  ///404
  static const String errorCode404 = '404';
  ///405
  static const String errorCode405 = '405';
  ///500
  static const String errorCode500 = '500';
  ///502
  static const String errorCode502 = '502';
  ///503
  static const String errorCode503 = '503';
  ///505
  static const String errorCode505 = '505';
  ///未知错误
  static const String unknownError = 'unknownError';
  ///请求取消
  static const String requestCancel = 'requestCancel';
  ///请求超时
  static const String sendTimeout = 'sendTimeout';
  ///响应超时
  static const String receiveTimeout = 'receiveTimeout';
  ///连接超时
  static const String connectionTimeout = 'connectionTimeout';
  ///网络连接异常,请检查网络！
  static const String networkConnectionException = 'networkConnectionException';
  ///缺少必要权限
  static const String noPermission = 'noPermission';
  ///取消
  static const String cancel = 'cancel';
  ///确认
  static const String confirm = 'confirm';
  ///加载中
  static const String loading = 'loading';
  ///下载中
  static const String downloading = 'downloading...';
  ///下载失败
  static const String downloadFail = 'downloadFail';
  ///下载成功
  static const String downloadSuccess = 'downloadSuccess';
  ///图片保存失败
  static const String imgSaveFail = 'imgSaveFail';
  ///图片保存成功
  static const String imgSaveSuccess = 'imgSaveSuccess';
  ///登录
  static const String login = 'login';
  ///注册
  static const String register = 'register';
  ///发送验证码
  static const String sendSms = 'sendSms';
  ///用户拒绝授权
  static const String userRefusedAuthorization = 'userRefusedAuthorization';
  ///用户取消授权
  static const String userCancelAuthorization = 'userCancelAuthorization';
  ///和
  static const String and = 'and';
}



class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          Ids.warmPrompt: '温馨提示',
          Ids.agreementContent1: '请您在阅读本产品之前仔细阅读',
          Ids.agreementContent2: '《用户协议》',
          Ids.agreementContent3: '与',
          Ids.agreementContent4: '《隐私协议》',
          Ids.agreementContent5:
              '我们一向尊重并会严格保护用户在使用本产品时的合法权益（包括用户隐私、用户数据等）不受到任何侵犯。本协议（包括本文最后部分的隐私政策）是用户（包括通过各种合法途径获取到本产品的自然人、法人或其他组织机构，以下简称“用户”或“您”）与我们之间针对本产品相关事项最终的、完整的且排他的协议，并取代、合并之前的当事人之间关于上述事项的讨论和协议。本协议将对用户使用本产品的行为产生法律约束力，您已承诺和保证有权利和能力订立本协议。用户开始使用本产品将视为已经接受本协议，请认真阅读并理解本协议中各种条款，包括免除和限制我们的免责条款和对用户的权利限制（未成年人审阅时应由法定监护人陪同），如果您不能接受本协议中的全部条款，请勿开始使用本产品',
          Ids.disagree:'不同意',
          Ids.agree:'同意',
          Ids.jumpCount:'跳过 ',
          Ids.dataParsingException:'数据解析异常...',
          Ids.errorCode:'错误码',
          Ids.errorCode400:'请求语法错误',
          Ids.errorCode401:'没有权限',
          Ids.errorCode403:'服务器拒绝执行',
          Ids.errorCode404:'无法连接服务器',
          Ids.errorCode405:'请求方法被禁止',
          Ids.errorCode500:'服务器内部错误',
          Ids.errorCode502:'无效的请求',
          Ids.errorCode503:'服务器异常',
          Ids.errorCode505:'不支持HTTP协议请求',
          Ids.unknownError:'未知错误',
          Ids.requestCancel:'请求取消',
          Ids.sendTimeout:'请求超时',
          Ids.receiveTimeout:'响应超时',
          Ids.connectionTimeout:'连接超时',
          Ids.networkConnectionException:'网络连接异常,请检查网络！',
          Ids.noPermission:'缺少必要权限！',
          Ids.cancel:'取消',
          Ids.confirm:'确认',
          Ids.loading:'加载中...',
          Ids.downloading:'下载中...',
          Ids.downloadFail:'下载失败',
          Ids.downloadSuccess:'下载成功',
          Ids.imgSaveFail:'图片保存失败',
          Ids.imgSaveSuccess:'图片保存成功',
          Ids.login:'登录',
          Ids.register:'注册',
          Ids.sendSms:'发送验证码',
          Ids.userRefusedAuthorization:'用户拒绝授权',
          Ids.userCancelAuthorization:'用户取消授权',
        },
        'en_US': {
          Ids.warmPrompt: 'Warm Prompt',
          Ids.agreementContent1: 'Please read the agreement carefully before reading this product',
          Ids.agreementContent2:'《user agreement》',
          Ids.agreementContent3: 'And',
          Ids.agreementContent4: '《Privacy agreement》',
          Ids.agreementContent5: 'We always respect and strictly protect the legitimate rights and interests of users (including user privacy and user data, etc.) when using this product from any infringement. This Agreement (including the privacy policy at the end of this article) is the final, complete and exclusive agreement between users (including natural persons, legal persons or other organizations that obtain the Product through various legal means, hereinafter referred to as "Users" or "you") and us for matters related to the Product. And supersede or merge the discussions and agreements between the parties on the above matters prior to the merger. This Agreement will be legally binding on user\'s use of the Product, and you have promised and guaranteed that you have the right and ability to enter into this Agreement. Users start to use this product will be treated as have to accept this agreement, please carefully read and understand the various provisions of the provisions of this agreement, including the exemption and limit our disclaimer and restriction on the rights of the user review (minors should be accompanied by legal guardian), if you can\'t accept all the terms of this agreement, please do not start using this product',
          Ids.disagree:'Disagree',
          Ids.agree:'Agree',
          Ids.jumpCount:'Jump ',
          Ids.dataParsingException:'data parsing exception...',
          Ids.errorCode:'errorCode',
          Ids.errorCode400:'Request syntax error',
          Ids.errorCode401:'do not have permission',
          Ids.errorCode403:'Server rejects execution',
          Ids.errorCode404:'Unable to connect to server',
          Ids.errorCode405:'The request method is disabled',
          Ids.errorCode500:'Server internal error',
          Ids.errorCode502:'Invalid request',
          Ids.errorCode503:'Server exception',
          Ids.errorCode505:'HTTP requests are not supported',
          Ids.unknownError:'unknown error',
          Ids.requestCancel:'request cancel',
          Ids.sendTimeout:'request timeout',
          Ids.receiveTimeout:'receive timeout',
          Ids.connectionTimeout:'connection timeout',
          Ids.networkConnectionException:'The network connection is abnormal, please check the network!',
          Ids.noPermission:'noPermission',
          Ids.cancel:'cancel',
          Ids.confirm:'confirm',
          Ids.loading:'loading...',
          Ids.downloading:'downloading...',
          Ids.downloadFail:'downloadFail',
          Ids.downloadSuccess:'downloadSuccess',
          Ids.imgSaveFail:'imgSaveFail',
          Ids.imgSaveSuccess:'imgSaveSuccess',
          Ids.login:'login',
          Ids.register:'register',
          Ids.sendSms:'sendSms',
          Ids.userRefusedAuthorization:'User Refused Authorization',
          Ids.userCancelAuthorization:'User Cancel Authorization',
        }
      };
}
