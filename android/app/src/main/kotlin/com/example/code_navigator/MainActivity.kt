package com.code.navigator

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){

    private val CHANNEL = "app.channel.shared.data"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getFlavor") {
                val flavor = BuildConfig.FLAVOR ?: "default" // 如果 FLAVOR 为空，返回 "default"
                result.success(flavor)
            } else if (call.method == "getSensitiveData") {
                val sensitiveData = BuildConfig.WX_API_KEY // 通过 BuildConfig 访问 Gradle 中定义的值
                result.success(sensitiveData)
            } else {
                result.notImplemented()
            }
        }
    }
}
