// import 'package:flutter/cupertino.dart';
// import 'package:fluwx/fluwx.dart';
//
// import '../app_config.dart';
// import 'common_util.dart';
//
// ///微信分享工具类
// class WXShareUtil {
//   ///分享APP应用市场链接
//   static shareApp(WeChatScene scene) {
//     shareToWeChat(WeChatShareWebPageModel(CommonUtils.getAppUrl(),
//             scene: scene, title: AppConfig.appName, description: "全网视频素材，应有尽有"))
//         .then((value) {});
//   }
//
//   ///@description TODO 分享文本
//   ///@param 分享场景，内容
//   ///@return
//   ///@updateTime 2023/2/27 15:39
//   ///@author Xcd
//   static shareWords(WeChatScene scene, String content) {
//     shareToWeChat(WeChatShareTextModel(content, scene: scene));
//   }
//
//   ///@description TODO 图片分享微信
//   ///@param 图片路径，描述，context
//   ///@return
//   ///@updateTime 2023/2/27 15:43
//   ///@author Xcd
//   static sharePicWorld(String? pic, String? world, BuildContext context) {
//     WeChatImage image;
//     if (pic == null) {
//       image = WeChatImage.asset(Images.launchImage);
//     } else {
//       image = WeChatImage.network(pic);
//     }
//     shareToWeChat(WeChatShareWebPageModel(CommonUtils.getAppUrl(),
//             thumbnail: image,
//             scene: WeChatScene.SESSION,
//             title: AppConfig.appName,
//             description: world))
//         .then((value) {});
//   }
// }
