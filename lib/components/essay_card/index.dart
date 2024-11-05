import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/post_model.dart';
import 'package:codefather_app/components/picture_list/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 通用的交流卡片
class EssayCard extends StatelessWidget {
  final PostModel data;
  const EssayCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 卡片头像
        _buildUserInfo(),
        // 卡片内容,
        _buildDescription(),
        // 图片集合
        _buildPictureList(),
        // 按钮操作
        _buildAction()
      ],
    );
  }

  // 卡片上用户信息
  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          UserAvatar(
            user: data.user,
            size: 10,
          ),
          const SizedBox(
            width: 6,
          ),
          UserTitle(
            user: data.user,
            color: tertiaryColor,
            fontSize: 13,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            formatTimeFromNow(data.createTime),
            style: const TextStyle(color: tertiaryColor, fontSize: 12),
          )
        ],
      ),
    );
  }

  // 卡片简介
  Widget _buildDescription() {
    String content = data.plainTextDescription ?? data.content ?? '';
    return GestureDetector(
      onTap: () => Get.toNamed('/essay/${data.id}', arguments: {'id': data.id}),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          content,
          style: const TextStyle(color: tertiaryColor, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // 帖子图片
  Widget _buildPictureList() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: PictureList(pictureList: data.pictureList ?? []),
    );
  }

  // 操作区（点赞/评论/收藏）
  Widget _buildAction() {
    // 使用一个列表来存储操作项
    final actions = [
      _buildActionItem(Icons.thumb_up_alt_outlined, data.thumbNum ?? 0),
      // _buildActionItem(Icons.star_border, widget.data.favourNum ?? 0),
      _buildActionItem(Icons.mode_comment_outlined, data.commentNum ?? 0),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actions,
      ),
    );
  }

  // 构建单个操作项
  Widget _buildActionItem(IconData icon, int count) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: tertiaryColor,
          size: 15,
        ),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: const TextStyle(color: tertiaryColor),
        ),
        const SizedBox(width: 16), // 添加间隔
      ],
    );
  }
}
