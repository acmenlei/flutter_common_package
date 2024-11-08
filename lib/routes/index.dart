import 'package:codefather_app/pages/essayDetail/index.dart';
import 'package:codefather_app/pages/index/index.dart';
import 'package:codefather_app/pages/login/index.dart';
import 'package:codefather_app/pages/login/login_binding.dart';
import 'package:codefather_app/pages/login/login_code.dart';
import 'package:codefather_app/pages/post/index.dart';
import 'package:codefather_app/pages/qaDetail/index.dart';
import 'package:codefather_app/pages/settings/index.dart';
import 'package:codefather_app/pages/user/index.dart';
import 'package:codefather_app/pages/webview/web_binding.dart';
import 'package:codefather_app/pages/webview/web_page.dart';
import 'package:get/route_manager.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const MainPage(),
  ),
  GetPage(
    name: '/post/:id',
    page: () => const PostDetailPage(),
  ),
  GetPage(
    name: '/essay/:id',
    page: () => const EssayDetailPage(),
  ),
  GetPage(
    name: '/qa/:id',
    page: () => const QaDetailPage(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/user/:id',
    page: () => const UserPage(),
  ),
  GetPage(name: '/webview', page: () => const WebPage(), binding: WebBinding()),
  GetPage(name: '/settings', page: () => const SettingPage()),
  GetPage(
      name: '/login/code',
      binding: LoginBinding(),
      page: () => const LoginCodePage()),
];
