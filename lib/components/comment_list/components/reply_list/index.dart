import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/comment_model.dart';
import 'package:codefather_app/constants/colors.dart';

/// 回复列表
class ReplyList extends StatelessWidget {
  final List<ReplyVo>? data;
  final int targetType; // 评论类型
  final String commentId; // 评论id
  const ReplyList(
      {super.key,
      this.data,
      required this.targetType,
      required this.commentId});

  @override
  Widget build(BuildContext context) {
    if (data?.isEmpty == true) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: tertiaryColor.withOpacity(0.04)),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(top: index > 0 ? 8 : 0),
          child: _buildReplyItem(
            data![index],
          ),
        ),
        itemCount: data?.length ?? 0,
      ),
    );
  }

  // 回复内容
  _buildReplyItem(ReplyVo reply) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(style: const TextStyle(color: tertiaryColor), children: [
        TextSpan(
            text: reply.user?.userName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        _buildReplyUserName(reply),
        const TextSpan(text: "："),
        TextSpan(text: reply.content)
      ]),
    );
  }

  // 回复的用户昵称
  _buildReplyUserName(ReplyVo reply) {
    if (reply.replyUser == null) {
      return const TextSpan();
    }

    return TextSpan(
      text: " 回复 ",
      style: const TextStyle(color: tertiaryColor),
      children: [
        TextSpan(
          text: reply.replyUser?.userName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
