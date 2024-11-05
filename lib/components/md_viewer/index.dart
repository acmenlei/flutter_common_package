import 'package:flutter/material.dart';
import 'package:codefather_app/components/cached_image/index.dart';
import 'package:codefather_app/pages/image_preview/index.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:markdown_widget/markdown_widget.dart';

// markdown语法解析组件
class MdViewer extends StatelessWidget {
  final String content;
  final TocController? tocController;

  const MdViewer({super.key, this.content = '', this.tocController});

  @override
  Widget build(BuildContext context) {
    var realContent = _convertImagesToMarkdown(content);

    return MarkdownWidget(
      tocController: tocController,
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      data: realContent,
      config: MarkdownConfig(
        configs: [
          const PConfig(
            textStyle: TextStyle(fontSize: 15, height: 1.7),
          ),
          // 链接配置
          LinkConfig(
            style: TextStyle(
              color: getPrimaryColor(),
              decoration: TextDecoration.underline,
              decorationColor: getPrimaryColor(),
            ),
            onTap: toWebView,
          ),
          ImgConfig(
            builder: (url, attributes) => GestureDetector(
              onTap: () => Get.to(() => ImagePreview(imageUrl: url)),
              child: CommonCachedImage(imageUrl: url),
            ),
            // todo errorBuilder
          )
        ],
      ),
    );
  }

  // 将图片转为 markdown 语法格式
  String _convertImagesToMarkdown(String data) {
    final document = html_parser.parse(data);
    final imgTags = document.getElementsByTagName('img');
    // 替换 img 标签为 Markdown 格式
    for (var img in imgTags) {
      final src = img.attributes['src'] ?? '';
      final alt = img.attributes['alt'] ?? '';
      final markdownImage = '![$alt]($src)'; // Markdown 格式
      final imgSlot = img.outerHtml.substring(0, img.outerHtml.length - 1);
      final isContains = data.contains('$imgSlot />');
      data = data.replaceFirst(
          isContains ? '$imgSlot />' : img.outerHtml, markdownImage);
    }
    return data; // 返回替换后的字符串
  }
}
