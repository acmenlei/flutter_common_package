import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/post_model.dart';
import 'package:codefather_app/components/cached_image/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 通用的内容型卡片
class PostCard extends StatelessWidget {
  final PostModel data;
  const PostCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 卡片标题
        _buildTitle(),
        // 帖子内容
        _buildContent(),
        // 按钮操作
        _buildAction(),
      ],
    );
  }

  // 标题
  Widget _buildTitle() {
    String title = data.title ?? '';
    if (title.isEmpty) {
      return Container();
    }
    return GestureDetector(
      onTap: () => Get.toNamed('/post/${data.id}', arguments: {'id': data.id}),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 15, color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
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
      onTap: () => Get.toNamed('/post/${data.id}', arguments: {'id': data.id}),
      child: SizedBox(
        // width: double.infinity,
        child: Text(
          content,
          style: const TextStyle(color: tertiaryColor, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // 帖子内容部分
  Widget _buildContent() {
    return Row(
      // mainAxisAlignment: ,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 卡片头像
              _buildUserInfo(),
              // 卡片内容,
              _buildDescription()
            ],
          ),
        ),
        _buildCover()
      ],
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

  // 帖子封面
  Widget _buildCover() {
    String cover = data.thumbnailCover ?? data.cover ?? '';
    if (cover.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0), // 设置圆角
        // child: Image.network(cover, height: 60),
        child: CommonCachedImage(imageUrl: cover, height: 60,),
      ),
    );
  }
}