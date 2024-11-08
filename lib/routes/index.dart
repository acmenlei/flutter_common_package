import 'package:codefather_app/pages/essayDetail/index.dart';
import 'package:codefather_app/pages/index/index.dart';
import 'package:codefather_app/pages/login/index.dart';
import 'package:codefather_app/pages/login/login_binding.dart';
import 'package:codefather_app/pages/login/login_code.dart';
import 'package:codefather_app/pages/post/index.dart';
import 'package:codefather_app/pages/qaDetail/index.dart';
import 'package:codefather_app/pages/search/index.dart';
import 'package:codefather_app/pages/settings/index.dart';
import 'package:codefather_app/pages/user/index.dart';
import 'package:codefather_app/pages/webview/web_binding.dart';
import 'package:codefather_app/pages/webview/web_page.dart';
import 'package:get/route_manager.dart';

final routes = [
  // 主页
  GetPage(name: '/', page: () => const MainPage(), popGesture: false),
  // 帖子详情页
  GetPage(
    name: '/post/:id',
    page: () => const PostDetailPage(),
  ),
  // 交流详情页
  GetPage(
    name: '/essay/:id',
    page: () => const EssayDetailPage(),
  ),
  // 问答详情页
  GetPage(
    name: '/qa/:id',
    page: () => const QaDetailPage(),
  ),
  // 登录页
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
  ),
  // 登录验证码校验
  GetPage(
    name: '/login/code',
    binding: LoginBinding(),
    page: () => const LoginCodePage(),
  ),
  // 用户主页
  GetPage(
    name: '/user/:id',
    page: () => const UserPage(),
  ),
  // webview渲染
  GetPage(name: '/webview', page: () => const WebPage(), binding: WebBinding()),
  // 设置页
  GetPage(name: '/settings', page: () => const SettingPage()),
  // 综合搜索页
  GetPage(name: '/search', page: () => const GeneralSearchPage()),
];
