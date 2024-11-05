import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 支持缓存的图片
class CommonCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CommonCachedImage(
      {super.key,
      required this.imageUrl,
      this.fit = BoxFit.cover,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.endsWith(".svg")) {
      return imageUrl.startsWith("http")
          ? SvgPicture.network(imageUrl, fit: fit, width: width, height: height)
          : SvgPicture.asset(imageUrl, fit: fit, width: width, height: height);
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      fadeInDuration: const Duration(seconds: 0), // 隐藏加载动画
      fadeOutDuration: const Duration(seconds: 0), // 隐藏加载动画
      // progressIndicatorBuilder: (context, url, progress) => Center( // 暂时隐藏加载动画【阅读文章返回的时候会导致定位不准确】
      //   child: SizedBox(
      //     width: 26,
      //     height: 26,
      //     child: CircularProgressIndicator(
      //       value: progress.progress,
      //       color: Colors.grey[300],
      //       strokeWidth: 2,
      //     ),
      //   ),
      // ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
