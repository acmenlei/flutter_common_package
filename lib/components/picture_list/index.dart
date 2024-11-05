import 'package:flutter/material.dart';
import 'package:codefather_app/components/cached_image/index.dart';
import 'package:codefather_app/pages/image_preview/index.dart';
import 'package:get/get.dart';

/// 图片列表
class PictureList extends StatelessWidget {
  final List<String>? pictureList;
  const PictureList({super.key, this.pictureList});

  // @override
  // Widget build(BuildContext context) {
  //   List<String> data = pictureList ?? [];
  //   return GridView.builder(
  //       padding: const EdgeInsets.symmetric(vertical: 0),
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(), // 禁止滑动
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 3, // 设置列数为3
  //         childAspectRatio: 1, // 设置宽高比为1
  //         crossAxisSpacing: 8, // 列间距
  //         mainAxisSpacing: 8, // 行间距
  //       ),
  //       itemBuilder: (builde, index) => GestureDetector(
  //             onTap: () => Get.to(() => ImagePreview(imageUrl: data[index])),
  //             child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(6.0), // 设置圆角
  //                 child: Image.network(
  //                   data[index],
  //                   fit: BoxFit.cover,
  //                 )),
  //           ),
  //       itemCount: data.length);
  // }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    List<String> data = pictureList ?? [];

    return GridView.builder(
        // 需要有自己单独的，否则配合下拉刷新使用会导致共用下拉刷新容器的controller，导致刷新异常
        controller: controller,
        padding: const EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 设置列数为3
          childAspectRatio: 1, // 设置宽高比为1
          crossAxisSpacing: 8, // 列间距
          mainAxisSpacing: 8, // 行间距
        ),
        itemBuilder: (builde, index) => GestureDetector(
              onTap: () => Get.to(() => ImagePreview(imageUrl: data[index])),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0), // 设置圆角
                child:
                    CommonCachedImage(imageUrl: data[index], fit: BoxFit.cover),
              ),
            ),
        itemCount: data.length);
  }
}
