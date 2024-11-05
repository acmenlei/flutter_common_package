import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:codefather_app/components/comment_button/controller.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 点赞按钮
class CommentButton extends StatelessWidget {
  final Axis? axis; // 排版方向
  final dynamic data; // 数据
  final int targetType; // 点赞类型
  final double size;
  final double width;
  final String? type; // 评论数量显示规则？是评论的回复数还是文章的评论数？

  const CommentButton({
    super.key,
    this.axis = Axis.vertical,
    this.data,
    this.size = 18,
    this.width = 40,
    this.type = 'post', // 默认为显示文章的
    required this.targetType,
  });

  @override
  Widget build(BuildContext context) {
    // 初始化点赞数据
    CommentButtonController commentButtonController = CommentButtonController();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (type == 'post') {
        commentButtonController.commentNum.value = data?.commentNum ?? 0;
      } else {
        commentButtonController.commentNum.value =
            int.parse(data?.replyVoPage?.total);
      }
    });

    Widget child = axis == Axis.vertical
        ? _buildVertical(commentButtonController)
        : _buildHorizontal(commentButtonController);
    return SizedBox(width: width, child: child,);
  }

  // 垂直
  Widget _buildVertical(CommentButtonController commentButtonController) {
    return GestureDetector(
      onTap: () => commentButtonController.onPress(data?.id, targetType),
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.comment,
                color: tertiaryColor,
                size: size,
              ),
              Text(
                commentButtonController.commentNum.value.toString(),
                style: const TextStyle(
                  color: tertiaryColor,
                ),
              )
            ],
          )),
    );
  }

  // 横向
  Widget _buildHorizontal(CommentButtonController commentButtonController) {
    return GestureDetector(
      onTap: () => commentButtonController.onPress(data?.id, targetType),
      child: Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: FaIcon(
                  FontAwesomeIcons.comment,
                  color: tertiaryColor,
                  size: size,
                ),
              ),
              Text(
                commentButtonController.commentNum.value.toString(),
                style: const TextStyle(
                  color: tertiaryColor,
                ),
              )
            ],
          )),
    );
  }
}
