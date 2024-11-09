import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/comment_model.dart';
import 'package:codefather_app/components/common_editor/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/components/comment_button/index.dart';
import 'package:codefather_app/components/favour_button/index.dart';
import 'package:codefather_app/components/follow_button/index.dart';
import 'package:codefather_app/components/thumb_button/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';

// 底部信息和操作
class BottomInfoAction extends StatelessWidget {
  final dynamic post;
  final Function(CommentVo comment)? onRefresh;
  final TocController? tocController;
  final int thumbTargetType; // 点赞targetType
  final int favourTargetType; // 收藏targetType
  final int commentTargetType; // 评论targetType

  const BottomInfoAction({
    super.key,
    this.post,
    this.tocController,
    this.onRefresh,
    required this.thumbTargetType,
    required this.favourTargetType,
    required this.commentTargetType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor())),
        color: Get.theme.colorScheme.surface,
      ),
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none, // 不裁剪
            children: [
              UserAvatar(user: post?.user),
              // 关注按钮
              Positioned(
                bottom: -15, // 将按钮定位到底部
                left: 1,
                child: Container(
                  transform: Matrix4.identity()..scale(0.5), // 缩小按钮
                  child: FollowButton(user: post?.user),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          CommentButton(data: post, targetType: commentTargetType),
          ThumbButton(data: post, targetType: thumbTargetType),
          FavourButton(data: post, targetType: favourTargetType),
          _buildTocButton(context, tocController),
          _buildPublishInput(context),
        ],
      ),
    );
  }

  // 渲染目录控制器
  _buildTocButton(context, tocController) {
    if (tocController == null) {
      return Container();
    }
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          builder: (context) =>
              TocWidget(controller: tocController, shrinkWrap: true),
          context: context,
          showDragHandle: true,
          enableDrag: true,
          backgroundColor: Get.theme.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      },
      child: Container(
        width: 40,
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.list,
              color: tertiaryColor,
              size: 18,
            ),
            Text(
              '目录',
              style: TextStyle(color: tertiaryColor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  _buildPublishInput(context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          builder: (context) => CommonEditor(
            onSubmit: Http.client.addCommentUsingPOST,
            onRefresh: onRefresh,
            extraParams: {
              "targetType": commentTargetType,
              "targetId": post?.id
            },
          ),
          context: context,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Container(
          margin:
              const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.pen,
                    color: tertiaryColor.withOpacity(.5),
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '写评论',
                    style: TextStyle(color: tertiaryColor.withOpacity(.5)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
