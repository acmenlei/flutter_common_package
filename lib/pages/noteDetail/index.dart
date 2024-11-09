import 'package:codefather_app/components/tag_list/index.dart';
import 'package:codefather_app/pages/noteDetail/controller.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/components/bottom_info_action/index.dart';
import 'package:codefather_app/components/comment_list/index.dart';
import 'package:codefather_app/components/md_viewer/index.dart';
import 'package:codefather_app/components/my_divider/index.dart';
import 'package:codefather_app/components/user_info/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/constants/comment.dart';
import 'package:codefather_app/constants/favour.dart';
import 'package:codefather_app/constants/thumb.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 问答详情页
class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    NoteDetailController note = NoteDetailController();

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomInfoAction(
          post: note.data.value, // 帖子数据
          thumbTargetType: ThumbTargetTypeEnum.note.value, // 点赞类型
          favourTargetType: FavourTargetTypeEnum.note.value, // 收藏类型
          commentTargetType: CommentTypeEnum.note.value, // 评论类型
          onRefresh: note.onRefreshComment,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [_buildAppBar(note)],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 提问标题
              _buildTitle(note),
              // 用户信息【通用的公共组件】
              Obx(() => UserInfo(user: note.data.value.user)),
              // 文章内容
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Obx(() => MdViewer(content: note.data.value.content ?? '')),
              ),
              _buildTags(note),
              _buildPublishTime(note),
              ..._buildSplitter(),
              _buildCommentList(note),
            ],
          ),
        ),
      ),
    );
  }

  // 问答标题
  _buildTitle(note) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () => Text(
          note.data.value.title ?? '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 标题栏
  _buildAppBar(note) {
    return SliverAppBar(
      title: Obx(() => Text(note.data.value.title ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      floating: true,
      snap: true,
    );
  }

  // 评论列表
  _buildCommentList(note) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => CommentList(
          data: note.data.value,
          targetType: CommentTypeEnum.note.value,
          newComments: note.newComments,
          onRefresh: note.onClearNewComment,
        ),
      ),
    );
  }

  // 标签
  _buildTags(NoteDetailController note) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => TagList(tags: note.data.value.tags ?? []),
      ),
    );
  }

  // 发布时间
  _buildPublishTime(note) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Text(
          formatTimeFromNow(note.data.value.createTime ?? 0),
          style: const TextStyle(color: tertiaryColor),
        ),
      ),
    );
  }

  // 分割线
  _buildSplitter() {
    return [const MyDivider(color: true, margin: 10)];
  }
}
