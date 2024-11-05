import 'package:oktoast/oktoast.dart' as ok;
import 'styles.dart' show failedColor;

// 有时效的提示
void showToast(String text, {Duration? duration}) {
  ok.showToast(text, duration: duration);
}

// 在中间展示的提示
void showCenterToast(String text) {
  ok.showToast(
    text,
    position: ok.ToastPosition.center,
  );
}

// 错误的提示
void showErrorToast(String text) {
  ok.showToast(
    text,
    backgroundColor: failedColor,
  );
}

// 在中间显示的错误提示
void showCenterErrorToast(String text) {
  ok.showToast(
    text,
    position: ok.ToastPosition.center,
    backgroundColor: failedColor,
  );
}

// 在顶部显示的提示
void showTopToast(String text) {
  ok.showToast(
    text,
    position: ok.ToastPosition.top,
  );
}

// 自定义位置的提示
void showToastWithPosition(String text, {ok.ToastPosition? position}) {
  ok.showToast(
    text,
    position: position,
  );
}

// 自定义位置的错误提示
void showErrorToastWithPosition(String text, {ok.ToastPosition? position}) {
  ok.showToast(
    text,
    position: position,
  );
}

// 取消所有的消息提示
void dismissAllToast({bool showAnim = false}) {
  ok.dismissAllToast(showAnim: showAnim);
}
