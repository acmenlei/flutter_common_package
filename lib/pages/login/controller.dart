import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool checked = false.obs;
  RxString phone = ''.obs;
  RxString smsCaptcha = ''.obs;
  RxString captcha = "".obs;

  Fluwx fluwx = Fluwx();
  final AuthService authService = Get.find<AuthService>();
  late final void Function(WeChatResponse) fluwxCallback;

  @override
  void onInit() {
    super.onInit();
    // 初始化获取图形验证码
    getSmsCaptchaUsingGET();
    // 缓存微信登录回调
    fluwxCallback = (response) {
      if (response is WeChatAuthResponse) {
        if (response.code != null && response.code!.isNotEmpty) {
          loginByWxOpen(response.code!);
          LogUtil.e("微信登录返回的状态 --> code=${response.code}");
        } else {
          showToast("登录失败");
        }
      }
    };
    // 微信授权登录注册
    fluwx.registerApi(
      appId: "wx6713a1b6355eca34",
      universalLink: "https://www.codefather.cn/",
      doOnAndroid: true,
      doOnIOS: true,
    );
    fluwx.addSubscriber(fluwxCallback);
  }

  @override
  void onClose() {
    fluwx.removeSubscriber(fluwxCallback);
    super.onClose();
  }

  // 切换选中状态
  toggleChecked(bool? value) {
    checked.value = value ?? false;
  }

  // 手机号码
  changePhone(value) {
    phone.value = value;
  }

  // 图形验证码
  changeSmsCaptcha(value) {
    smsCaptcha.value = value;
  }

  // 获取图形验证码
  getSmsCaptchaUsingGET() async {
    try {
      final res = await Http.client.getSmsCaptchaUsingGET();
      if (res.code == 0) {
        // print("获取登录图形验证码：${res.data}");
        captcha.value = res.data;
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }

  // 发送验证码
  sendSmsCaptchaUsingPOST(Map<String, String>? params) async {
    final body = params ?? {"phone": phone.value, "captcha": smsCaptcha.value};
    try {
      final res = await Http.client.sendLoginSmsCodeUsingPOST(body);
      if (res.code == 0 && res.data == true) {
        showToast("验证码已发送");
        Get.toNamed('/login/code', arguments: body);
      } else {
        showErrorToast(res.message);
      }
      // print(res.toJson());
      return res.data;
    } catch (e) {
      LogUtil.e(e);
    }
    return false;
  }

  // 登录
  login(Map<String, dynamic> params) async {
    try {
      final res = await Http.client.doLogin(params);
      if (res.code == 0) {
        // 设置用户信息
        await authService.loginUser(res.data ?? UserModel());
        showToast('登录成功');
        Get.offAndToNamed('/');
      }
    } finally {}
  }

  // 获取微信授权登录的 code
  Future<void> loginByWxOpen(String code) async {
    try {
      LogUtil.e("获取到的 code --> $code");
      final res = await Http.client.loginByWxOpen(code);
      if (res.code == 0 && res.data?.id != null) {
        await authService.loginUser(res.data ?? UserModel());
        showToast('登录成功');
        Get.offAndToNamed('/');
      }
    } catch (e) {
      LogUtil.e("loginByWxOpen error --> $e");
    }
  }

  // 微信授权登录
  getWeChatAccessToken(String code) async {
    var url =
        "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx6713a1b6355eca34&secret=955cfc7b9f780ab45ae6186122fe5eaa&code=$code&grant_type=authorization_code";
    //当第一次登录成功后点击退出再登录时，会报40163的错误
    // 40163 指的是使用同一个code 多次请求获取token
    //解决方法：每次请求的code都不一样，所以我们只需在传code的地方让它刷新即可
    try {
      var response = await Dio().get(url);
      var result = response.data.toString();
      var data = jsonDecode(result);
      LogUtil.e("登录日志： getWeChatAccessToken data: $data");
      assert(data is Map);
      var accessToken = data['access_token'];
      var openid = data['openid'];
      getWeChatUserInfo(accessToken, openid); //获取微信用户信息
    } catch (e) {
      LogUtil.e("登录日志： getWeChatAccessToken error: $e");
    }
  }

  // 获取微信用户信息
  void getWeChatUserInfo(accessToken, openId) async {
    if (accessToken == null) return;
    var url = "https://api.weixin.qq.com/sns/userinfo?access_token=";
    url += accessToken + "&openid=" + openId.toString();
    try {
      var response = await Dio().get(url);
      var dataStr = response.data.toString();
      // var _userinfo = dataStr;
      // _saveUserInfo(_userinfo);
      var data = jsonDecode(dataStr);
      // var headImageUrl = data["headimgurl"];
      // var nickname = data["nickname"];
      LogUtil.e("登录日志： getWeChatUserInfo data: $data");
    } catch (e) {
      LogUtil.e("登录日志： getWeChatUserInfo error: $e");
    }
  }
}
