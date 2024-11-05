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

// 评论组件
class CommentItem extends StatelessWidget {
  final CommentVo data;
  final int targetType;
  const CommentItem({super.key, required this.data, required this.targetType});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(user: data.user, size: 17),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserTitle(user: data.user, fontSize: 13),
              UserDescription(user: data.user, fontSize: 12),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  data.content ?? "",
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
                  _buildRightAction(),
                ],
              ),
              ReplyList(
                data: data.replyVoPage?.records ?? [],
                targetType: targetType,
                commentId: data.id ?? '',
              ),
            ],
          ),
        ),
        // Text(data?.content ?? "评论内容"),
      ],
    );
  }

  // 发布时间
  _buildPublishTime() {
    return Text(
      formatTimeFromNow(data.createTime ?? 0),
      style:  TextStyle(color: tertiaryColor.withOpacity(.6), fontSize: 13),
    );
  }

  _buildRightAction() {
    return Row(
      children: [
        CommentButton(
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
