import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:codefather_app/components/thumb_button/controller.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 点赞按钮
class ThumbButton extends StatelessWidget {
  final Axis? axis; // 排版方向
  final dynamic data; // 数据
  final int targetType; // 点赞类型
  final double size;
  final double width;

  const ThumbButton({
    super.key,
    this.axis = Axis.vertical,
    this.data,
    this.size = 18,
    this.width = 40,
    required this.targetType,
  });

  @override
  Widget build(BuildContext context) {
    // 初始化点赞数据
    ThumbController thumbController = ThumbController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      thumbController.hasThumb.value = data?.hasThumb ?? false;
      thumbController.thumbNum.value = data?.thumbNum ?? 0;
    });

    Widget child = axis == Axis.vertical
        ? _buildVertical(thumbController)
        : _buildHorizontal(thumbController);
    return SizedBox(
      width: width,
      child: child,
    );
  }

  // 垂直
  Widget _buildVertical(ThumbController thumbController) {
    return GestureDetector(
      onTap: () => thumbController.onPress(data?.id, targetType),
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                thumbController.hasThumb.value
                    ? FontAwesomeIcons.solidThumbsUp
                    : FontAwesomeIcons.thumbsUp,
                color: thumbController.hasThumb.value
                    ? getPrimaryColor()
                    : tertiaryColor,
                size: size,
              ),
              Text(
                thumbController.thumbNum.value.toString(),
                style: TextStyle(
                  color: thumbController.hasThumb.value
                      ? getPrimaryColor()
                      : tertiaryColor,
                ),
              )
            ],
          )),
    );
  }

  // 横向
  Widget _buildHorizontal(ThumbController thumbController) {
    return GestureDetector(
      onTap: () => thumbController.onPress(data?.id, targetType),
      child: Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: FaIcon(
                  thumbController.hasThumb.value
                      ? FontAwesomeIcons.solidThumbsUp
                      : FontAwesomeIcons.thumbsUp,
                  color: thumbController.hasThumb.value
                      ? getPrimaryColor()
                      : tertiaryColor,
                  size: size,
                ),
              ),
              Text(
                thumbController.thumbNum.value.toString(),
                style: TextStyle(
                  color: thumbController.hasThumb.value
                      ? getPrimaryColor()
                      : tertiaryColor,
                ),
              )
            ],
          )),
    );
  }
}
