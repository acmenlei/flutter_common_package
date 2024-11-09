import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/comment_list/components/comment_item/controller.dart';
import 'package:codefather_app/components/common_editor/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/comment_model.dart';
import 'package:codefather_app/components/comment_button/index.dart';
import 'package:codefather_app/components/comment_list/components/reply_list/index.dart';
import 'package:codefather_app/components/thumb_button/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_description/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/constants/thumb.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

// 评论组件
class CommentItem extends StatelessWidget {
  final CommentVo data;
  final dynamic originPost; // 评论的帖子
  final int targetType;
  const CommentItem({
    super.key,
    required this.data,
    required this.targetType,
    required this.originPost,
  });

  @override
  Widget build(BuildContext context) {
    CommenItemController commenItemController = CommenItemController(data);

    return Obx(() {
      final comment = commenItemController.comment.value;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(user: comment.user, size: 17),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserTitle(user: comment.user, fontSize: 13),
                UserDescription(user: comment.user, fontSize: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    comment.content ?? "",
                    style: const TextStyle(color: secondaryColor),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // 控制栏
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPublishTime(),
                    _buildRightAction(commenItemController, context),
                  ],
                ),
                ReplyList(
                  data: comment.replyVoPage?.records ?? [],
                  targetType: targetType,
                  commentId: comment.id ?? '',
                ),
              ],
            ),
          ),
          // Text(data?.content ?? "评论内容"),
        ],
      );
    });
  }

  // 发布时间
  _buildPublishTime() {
    return Text(
      formatTimeFromNow(data.createTime ?? 0), // 时间直接传递进来的 data 即可，因为它不会更新
      style: TextStyle(color: tertiaryColor.withOpacity(.6), fontSize: 13),
    );
  }

  _buildRightAction(CommenItemController commenItemController, context) {
    return Row(
      children: [
        CommentButton(
          onPress: () => showModalBottomSheet(
            builder: (context) => CommonEditor(
              onSubmit: Http.client.addReplyUsingPOST,
              onRefresh: commenItemController.onRefresh,
              extraParams: {"commentId": data.id},
            ),
            context: context,
            backgroundColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          axis: Axis.horizontal,
          targetType: targetType,
          data: data,
          size: 14,
          type: 'comment',
        ),
        const SizedBox(
          width: 8,
        ),
        ThumbButton(
          axis: Axis.horizontal,
          targetType: ThumbTargetTypeEnum.comment.value,
          data: data,
          size: 14,
        ),
      ],
    );
  }
}
