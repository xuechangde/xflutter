package com.cdx.xflutter;

import com.umeng.commonsdk.UMConfigure;

import io.flutter.app.FlutterApplication;

public class XApplication extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        preInit();
    }

    // SDK预初始化函数
    private void preInit(){
        //友盟SDK预加载
        UMConfigure.setLogEnabled(true);
        UMConfigure.preInit(this,"63f1cae3d64e686139327123","Umeng");
        //设置上下文
        com.umeng.umeng_common_sdk.UmengCommonSdkPlugin.setContext(this);
        android.util.Log.i("UMLog", "onCreate@MainActivity");
    }
}
