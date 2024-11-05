import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/constants/index.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:get/get.dart';

import 'web_logic.dart';
import 'web_state.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final logic = Get.find<WebLogic>();
  final WebState state = Get.find<WebLogic>().state;

  bool _disposed = false;
  bool _isLoading = true; // 用于控制加载指示器的显示
  WebViewStatus _status = WebViewStatus.loading;

  String initialUrl = "";
  InAppWebViewController? get controller => _controller;
  InAppWebViewController? _controller;
  final ValueNotifier<double> scrollHeightNotifier = ValueNotifier<double>(1);
  final ValueNotifier<int> progressNotifier = ValueNotifier<int>(0);

  final CookieManager cookieManager = CookieManager.instance();

  @override
  void dispose() {
    Get.delete<WebLogic>();
    progressNotifier.dispose();
    scrollHeightNotifier.dispose();
    _controller = null;
    _disposed = true;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _setCookies();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    initialUrl = arguments['webUrl'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(initialUrl)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                applicationNameForUserAgent: 'Code Nav App',
                mediaPlaybackRequiresUserGesture: false,
                javaScriptEnabled: true,
              ),
              android: AndroidInAppWebViewOptions(
                // disableDefaultErrorPage: true,
                forceDark: AndroidForceDark.FORCE_DARK_AUTO,
                mixedContentMode:
                    AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                safeBrowsingEnabled: false,
                useHybridComposition: true,
                overScrollMode: AndroidOverScrollMode.OVER_SCROLL_NEVER,
                displayZoomControls: false,
                builtInZoomControls: false,
                useWideViewPort: true,
              ),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true,
                automaticallyAdjustsScrollIndicatorInsets: true,
                isFraudulentWebsiteWarningEnabled: false,
                sharedCookiesEnabled: true,
                disallowOverScroll: true,
                enableViewportScale: true,
                ignoresViewportScaleLimits: true,
              ),
            ),
            onWebViewCreated: onWebViewCreated,
            onProgressChanged: (controller, progress) {
              state.progress.value = progress.toDouble();
              state.progressVisible.value = progress != 100;
            },
            onConsoleMessage: (controller, consoleMessage) {
              LogUtil.d('Console message: ${consoleMessage.message}');
            },
            onCreateWindow: (controller, createWindowRequest) async {
              return false;
            },
            onLoadStart: onLoadStart,
            onLoadStop: onLoadStop,
            onLoadError: onLoadError,
            onLoadResource: onLoadResource,
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.white, // 背景颜色
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _setCookies() async {
    final cookies = await Http.extractCookies();
    // 设置 cookie 的逻辑
    for (var cookie in cookies) {
      await cookieManager.setCookie(
        url: WebUri(initialUrl),
        name: cookie['name']!,
        value: cookie['value']!,
        domain: Global.domain,
        path: "/",
        isSecure: true,
        maxAge: 3600,
      );
    }
  }

  void onWebViewCreated(InAppWebViewController controller) {
    _controller = controller;
    _setCookies().then((_) {
      _controller?.loadUrl(urlRequest: URLRequest(url: WebUri(initialUrl)));
    });

    _controller?.loadUrl(urlRequest: URLRequest(url: WebUri(initialUrl)));

    _controller?.addJavaScriptHandler(
      handlerName: 'pageLoadComplete',
      callback: (List<dynamic> arguments) {
        setState(() {
          _isLoading = false;
        });
      },
    );
    _controller?.addJavaScriptHandler(
      handlerName: 'HeightNotifier',
      callback: (List<dynamic> arguments) async {
        if (_disposed) {
          return;
        }
        final int height = int.parse(arguments.first);
        scrollHeightNotifier.value = height.toDouble();
      },
    );
  }

  void onLoadStart(InAppWebViewController controller, Uri? uri) {
    if (_disposed) {
      return;
    }
    if (uri?.toString() == initialUrl || _status == WebViewStatus.failed) {
      _status = WebViewStatus.loading;
    }
  }

  Future<void> onLoadStop(InAppWebViewController controller, Uri? uri) async {
    if (!_disposed && uri.toString().contains(Global.domain)) {
      LogUtil.e("命中的地址 ---> ${uri.toString()}");
      await _controller?.evaluateJavascript(source: removeHeaderNavJs);
    }
    if (!_disposed && _status != WebViewStatus.failed) {
      await _controller?.evaluateJavascript(source: scrollHeightJs);
    }
    // 设置背景颜色为白色
    await _controller?.evaluateJavascript(
        source: "document.body.style.backgroundColor = 'white';");
    // 通知页面加载完成
    await _controller?.evaluateJavascript(source: pageLoadCompleteJs);
  }

  void onLoadError(
    InAppWebViewController controller,
    Uri? uri,
    int code,
    String message,
  ) {
    if (_disposed) {
      return;
    }
    LogUtil.e(
      'WebView onLoadError:\n'
      ' - [$uri]\n'
      ' - ($code) $message',
      stackTrace: StackTrace.current,
    );
    _status = WebViewStatus.failed;
    // 加载失败后隐藏加载指示器
    setState(() {
      _isLoading = false;
    });
  }

  void onLoadResource(
    InAppWebViewController controller,
    LoadedResource resource,
  ) {
    if (!_disposed && resource.url.toString().contains(initialUrl)) {
      // 页面资源加载完成后隐藏加载指示器
      setState(() {
        _isLoading = false;
      });
    }
  }
}

enum WebViewStatus { loading, failed, completed }

const String pageLoadCompleteJs = '''
(function() {
  function notifyFlutter() {
    if (window.flutter_inappwebview && window.flutter_inappwebview.callHandler) {
      window.flutter_inappwebview.callHandler('pageLoadComplete');
    }
    console.log("Page load complete");
  }

  function checkDOMChanges() {
    const observer = new MutationObserver((mutations, obs) => {
      // 当有 DOM 变化时，检查是否存在特定的标记或其他条件
      if (document.readyState === 'complete' && document.body) {
        notifyFlutter();
        obs.disconnect(); // 完成后断开观察器
      }
    });

    observer.observe(document, {
      childList: true,
      subtree: true
    });
  }

  if (document.readyState === 'complete') {
    notifyFlutter();
  } else {
    window.addEventListener('load', () => {
      checkDOMChanges();
    });
  }

  console.log("JavaScript loaded");
})();
''';

const String setBackgroundColorJs = '''
document.body.style.backgroundColor = 'white';
console.log("Background color set to white");
''';

// 移除 header 元素
const String removeHeaderNavJs = '''
(function() {
  function removeHeaders() {
    try {
      var headers = document.querySelectorAll('.ant-layout-header.ant-pro-top-menu.ant-pro-header-light,.course-header,.moblie-add-comment,.ant-card ant-card-contain-tabs');
      if (headers.length > 0) {
        headers.forEach(function(header) {
          header.remove();
        });
        console.log(headers.length + " headers removed successfully");
        clearInterval(checkInterval); // 成功删除元素后停止检查
      } else {
        console.log("Headers not found, retrying...");
      }
    } catch (e) {
      console.error("Error removing headers:", e);
    }
  }

  // 每0.5秒检查一次元素是否存在，直到成功删除
  var checkInterval = setInterval(removeHeaders, 500);

  window.addEventListener("load", function() {
    console.log("Load event fired");
    removeHeaders();
  });

  document.addEventListener("readystatechange", function() {
    if (document.readyState === "complete") {
      console.log("ReadyState complete event fired");
      removeHeaders();
    }
  });

  console.log("JavaScript loaded");
})();
''';

const String scrollHeightJs = '''(function() {
  var height = 0;
  var hasNotifier = window.flutter_inappwebview && window.flutter_inappwebview.callHandler;
  if (!hasNotifier) {
    return;
  }

  function checkAndNotify() {
    var curr = document.body.scrollHeight;
    if (curr !== height) {
      height = curr;
      window.flutter_inappwebview.callHandler(
        'HeightNotifier',
        height.toString()
      );
    }
  }

  var timer;
  var ob;
  if (window.ResizeObserver) {
    ob = new ResizeObserver(checkAndNotify);
    ob.observe(document.body);
  } else {
    timer = setTimeout(checkAndNotify, 200);
  }
  window.onbeforeunload = function() {
    ob && ob.disconnect();
    timer && clearTimeout(timer);
  };
  console.log("Scroll height script loaded");
})();
''';
