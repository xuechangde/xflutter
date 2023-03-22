import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:xflutter/common/common_index.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  final TapGestureRecognizer _userProtocolRecognizer;
  final TapGestureRecognizer _privacyProtocolRecognizer;

  const PrivacyPolicyDialog(
      this._userProtocolRecognizer, this._privacyProtocolRecognizer,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(Ids.warmPrompt.tr),
      content: Container(
        height: SizeUnit.dialogHeight,
        padding: EdgeInsets.only(top: SizeUnit.dialogTopPadding),
        child: SingleChildScrollView(
          child: _buildContent(context),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(Ids.disagree.tr),
          onPressed: () {
            Get.back(result: false);
            CommonUtils.doQuit();
          },
        ),
        CupertinoDialogAction(
          child: Text(Ids.agree.tr),
          onPressed: () {
            SpService.to.setBool(SpKeyConst.kPrivacyAuthorization, true);
            Get.back(result: true);
          },
        ),
      ],
    );
  }

  _buildContent(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: Ids.agreementContent1.tr,
      style: UiTextStyles.agreementTextStyle,
      children: [
        TextSpan(
          text: Ids.agreementContent2.tr,
          style: UiTextStyles.agreementTextBlueStyle,
          //点击事件
          recognizer: _userProtocolRecognizer
            ..onTap = () {
              //打开用户协议
            },
        ),
        TextSpan(
          text: Ids.agreementContent3.tr,
          style: UiTextStyles.agreementTextStyle,
        ),
        TextSpan(
          text: Ids.agreementContent4.tr,
          style: UiTextStyles.agreementTextBlueStyle,
          //点击事件
          recognizer: _privacyProtocolRecognizer
            ..onTap = () {
              //打开隐私协议
            },
        ),
        //后续显示的文本内容
        TextSpan(
          text: Ids.agreementContent5.tr,
          style: UiTextStyles.agreementTextStyle,
        )
      ],
    ));
  }
}
