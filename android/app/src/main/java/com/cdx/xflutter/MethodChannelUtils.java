package com.cdx.xflutter;

import android.content.Context;
import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MethodChannelUtils implements MethodChannel.MethodCallHandler {
    public static String CHANNEL = "native/method";
    public static MethodChannel methodChannel_toFlutter;
    private final Context context;

    MethodChannelUtils(Context context) {
        this.context =context;
    }

    public void registerWith(FlutterEngine registrar) {
        //这里对应dart端的 MethodChannel
        final MethodChannel channel = new MethodChannel(registrar.getDartExecutor(), CHANNEL);
        channel.setMethodCallHandler(new MethodChannelUtils(context));
        methodChannel_toFlutter = new MethodChannel(
                registrar.getDartExecutor().getBinaryMessenger(), "flutter/method"
        );
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Map<String, Object> map = (Map<String, Object>) call.arguments;
        switch (call.method) {
            //获取渠道名称
            case "getChannelName":
                String name = CommonUtils.getChannelName(context);
                result.success(name);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    /**
     * 原生调用flutter方法
     * @param methodName 方法名称
     * @param param 传递参数
     */
    public void invokeFlutterMethod_toAllFlutter(String methodName,Map<String,String> param) {
        if (methodChannel_toFlutter == null) {
            return;
        }
        switch (methodName) {
            //调用测试
            case "test":
                methodChannel_toFlutter.invokeMethod("test", param);
                break;
            default:
                break;
        }
    }
}
