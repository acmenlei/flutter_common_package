import 'package:codefather_app/api/models/comment_model.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/constants/comment.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:get/get.dart';

/// 用户帖子页
class UserCommentView extends StatefulWidget {
  final UserModel? user;
  const UserCommentView({super.key, this.user});

  @override
  State<UserCommentView> createState() => _UserCommentViewState();
}

class _UserCommentViewState extends State<UserCommentView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfinityScroll(
      fetcher: Http.client.listUserCommentPageUsingPOST, // 获取数据的接口
      searchParams: {
        "current": 1,
        "pageSize": 10,
        "sortField": "createTime",
        "sortOrder": "descend",
        "needPlainText": true,
        "userId": widget.user?.id
      }, // 搜索条件
      itemRender: (body) => UserPageCommentCard(data: body), // 渲染列表项
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// 用户评论卡片
class UserPageCommentCard extends StatelessWidget {
  final CommentVo? data;
  const UserPageCommentCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 卡片头像
        _buildUserInfo(),
        // 卡片内容,
        _buildDescription(),
        // 回复对方的对应帖子内容
        _buildAuthorPostContent()
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
            user: data?.user,
            size: 10,
          ),
          const SizedBox(
            width: 6,
          ),
          UserTitle(
            user: data?.user,
            color: tertiaryColor,
            fontSize: 13,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            formatTimeFromNow(data?.createTime),
            style: const TextStyle(color: tertiaryColor, fontSize: 12),
          )
        ],
      ),
    );
  }

  // 卡片简介
  Widget _buildDescription() {
    String content = data?.plainTextDescription ?? data?.content ?? '';
    return GestureDetector(
      onTap: onJumpOriginDetail,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          '回复：$content',
          style: const TextStyle(color: secondaryColor, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // 回复对方的对应帖子内容
  _buildAuthorPostContent() {
    // 这里有很多判断条件，根据回复的帖子取不同的字段
    dynamic originVo = getCurrentVo();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: tertiaryColor.withOpacity(.05),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(top: 8),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: '@${originVo?.user?.userName ?? '鱼友'}：',
              style: TextStyle(color: getPrimaryColor(), fontSize: 13),
              recognizer: TapGestureRecognizer()..onTap = onJumpOriginUserPage),
          TextSpan(
            text: originVo?.plainTextDescription ?? originVo?.content ?? '',
            style: const TextStyle(color: tertiaryColor, fontSize: 13),
            recognizer: TapGestureRecognizer()..onTap = onJumpOriginDetail,
          )
        ]),
      ),
    );
  }

  // 跳转原文章作者个人主页
  onJumpOriginUserPage() {
    dynamic originVo = getCurrentVo(); // 获取当前评论类型
    if (originVo == null) {
      showToast('未知的评论来源');
      return;
    }
    Get.toNamed('/user/${originVo?.user?.id}', arguments: {
      'id': originVo?.user?.id,
    });
  }

  // 跳转原文章详情
  onJumpOriginDetail() {
    String route = getCurrentCommentOriginType(); // 获取当前评论类型
    // 根据回复的帖子跳转对应的详情页
    switch (route) {
      // 帖子详情页
      case 'post':
        Get.toNamed('/$route/${data?.postVo?.id}',
            arguments: {"id": data?.postVo?.id});
        break;
      // 交流详情页【和 post 共用一个vo】
      case 'essay':
        Get.toNamed('/$route/${data?.postVo?.id}',
            arguments: {"id": data?.postVo?.id});
        break;
      // 问答详情页
      case 'qa':
        Get.toNamed('/$route/${data?.qaVo?.id}',
            arguments: {"id": data?.qaVo?.id});
        break;
      // 课程详情页
      case 'course':
        Get.toNamed(
          '/$route/${data?.courseArticleVo?.courseId}/section/${data?.courseArticleVo?.id}',
          arguments: {
            "courseId": data?.courseArticleVo?.courseId,
            "id": data?.courseArticleVo?.id,
          },
        );
        break;
      // 默认【直播/笔记等待添加】
      default:
        showToast("未知的类型");
        break;
    }
  }

  // 获取当前的评论类型
  getCurrentVo() {
    dynamic originPost;
    String route = getCurrentCommentOriginType(); // 获取当前评论类型
    // 根据回复的帖子跳转对应的详情页
    switch (route) {
      // 帖子详情页
      case 'post':
        originPost = data?.postVo;
        break;
      // 交流详情页【和 post 共用一个vo】
      case 'essay':
        originPost = data?.postVo;
        break;
      // 问答详情页
      case 'qa':
        originPost = data?.qaVo;
        break;
      // 课程详情页
      case 'course':
        originPost = data?.courseArticleVo;
        break;
      // 默认【直播/笔记等待添加】
      default:
        showToast("未知的类型");
        break;
    }
    return originPost;
  }

  // 获取当前评论类型
  getCurrentCommentOriginType() {
    for (var commentType in CommentTypeEnum.values) {
      if (commentType.value == data?.targetType) {
        return commentType.route;
      }
    }
    return CommentTypeEnum.post.route;
  }
}
