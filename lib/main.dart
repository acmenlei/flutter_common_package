import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/constants/theme.dart';
import 'package:codefather_app/pages/index/index.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/routes/index.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  // 确保 Flutter 框架在执行其他操作之前已完全初始化。它通常用于在你访问任何 Flutter 相关功能之前调用，尤其是在使用异步操作时。
  WidgetsFlutterBinding.ensureInitialized();
  // 设置应用程序的屏幕方向为只允许竖屏方向
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.white, // 设置状态栏背景为白色
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色（适合浅色背景）
      statusBarBrightness: Brightness.light, // 对 iOS 状态栏背景颜色的配置
    ),
  );
  Http.init(); // 初始化HTTP
  AuthService authService = AuthService(); // 初始化身份信息
  await authService.init(); // 登陆态校验初始化
  Get.put(authService); // 推送到Getx中，让后续页面都可以使用 Auth
  // 启动应用
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = isDark(context); // 是否为暗黑模式

    return OKToast(
      child: GetMaterialApp(
        title: '编程导航',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(colorScheme: MaterialTheme.darkScheme()),
        // defaultTransition: Transition.fadeIn, // 跳转动画
        theme: ThemeData(
          colorScheme: isDarkMode
              ? MaterialTheme.darkScheme()
              : MaterialTheme.lightScheme(),
          useMaterial3: true,
        ),
        locale: Get.deviceLocale, // 设置语言
        getPages: routes,
        initialRoute: '/',
        home: const MainPage(),
      ),
    );
  }
}
