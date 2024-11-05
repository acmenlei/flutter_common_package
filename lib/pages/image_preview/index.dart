import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// 图片预览能力
class ImagePreview extends StatelessWidget {
  final String imageUrl;

  const ImagePreview({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 设置背景填充为黑色
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop(); // 点击任意地方退出预览
        },
        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}

// 自己实现的图片预览能力
// child: InteractiveViewer(
//   child: Image.network(
//     imageUrl,
//     width: MediaQuery.of(context).size.width, // 宽度最大为手机宽度
//     height: double.infinity, // 高度自适应
//     fit: BoxFit.contain, // 保持图像比例
//   ),
// ),