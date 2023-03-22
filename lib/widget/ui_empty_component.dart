
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/images.dart';
import '../res/style/text_style.dart';

enum EmptyPageType {
  none,   // 未初始化
  noData, // 没有数据
  fail,// 失败
  noPermission // 没有查看权限
}

class UiEmptyComponent extends StatelessWidget {
  UiEmptyComponent({
    Key? key,
    this.image = Images.defNoData,
    this.text = "暂无数据",
    this.pageType = EmptyPageType.noData,
  }) : super(key: key){

    if (pageType == EmptyPageType.fail) {
      text = "加载失败";
      return;
    }
    if (pageType == EmptyPageType.noData) {
      text = "暂无数据";
      return;
    }
    if (pageType == EmptyPageType.noPermission) {
      text = "暂无查看权限";
      return;
    }
  }

  String image;
  String text;
  final EmptyPageType? pageType;


  @override
  Widget build(BuildContext context) {
    if (pageType == EmptyPageType.none) {
      return const SizedBox(width: 0,height: 0);
    }
    return Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: 75,
              fit: BoxFit.fitWidth,
            ),
            Container(
                margin: const EdgeInsets.only(top: 10, bottom: 0),
                child: Text(
                  text,
                  style: UiTextStyles.hint24Style,
                ))
          ]),
    );
  }
}