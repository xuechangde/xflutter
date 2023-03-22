import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_index.dart';
import '../../common/service/api_service.dart';
import 'splash_logic.dart';

class SplashPage extends GetView<SplashLogic> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
      type: MaterialType.transparency,
      color: Colors.white,
      child: Stack(
        children: [
          ///品牌推广View,可自定义为指定品牌样式，我这里随便设置一个背景图
          Image.asset(
            CommonUtils.getImgPath(Images.launchImage),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          ///当用户隐私授权之后且品牌View显示2秒之后展示广告图，可根据自身产品添加轮播图为效果
          if (controller.state.isAgreement.value&&controller.state.isShow.value)
            Image.network(
              Constant.splashImgUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            )..image.resolve(const ImageConfiguration()).addListener(
                ImageStreamListener((ImageInfo info, bool syncCall) {
                  ///网络图片加载完成,开始广告计时
                  if(!controller.state.isStart.value){
                    controller.state.isStart.value = true;
                    controller.doCountDown();
                  }
                },onError: (e,s){
                  controller.state.isShow.value = false;
                  ///加载失败直接跳转首页
                })
            ),
          Offstage(
            offstage: !controller.state.isStart.value,
            child: Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 40,right: 30),
              child: GestureDetector(
                onTap: () {
                  ApiService.to.getTestData();
                },
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: UiDecorations.padding4BlackTran40,
                    child: Text('${Ids.jumpCount.tr}${controller.state.count.value}',
                      style: UiTextStyles.primary,
                    )),
              ),
            ),
          ),
        ],
      ),
    ),);
    }
}
