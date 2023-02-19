package com.cdx.xflutter;

import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.ViewTreeObserver;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.splashscreen.SplashScreen;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import com.umeng.commonsdk.UMConfigure;

public class MainActivity extends FlutterActivity {
    //是否准备好，控制闪屏更长时间的显示
    boolean isReady = false;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        // 适配Android12闪屏.
        SplashScreen splashScreen = SplashScreen.installSplashScreen(this);
        super.onCreate(savedInstanceState);
        //延迟2秒钟绘制第一帧
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                isReady = true;
            }
        }, 2000);
        View content = findViewById(android.R.id.content);
        content.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (isReady) {
                    content.getViewTreeObserver().removeOnPreDrawListener(this);
                    return true;
                }
                return false;
            }
        });
        preInit();
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannelUtils(this).registerWith(flutterEngine);
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
