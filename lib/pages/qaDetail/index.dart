import 'package:codefather_app/components/tag_list/index.dart';
import 'package:codefather_app/pages/qaDetail/controller.dart';
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

/// 帖子详情页
class QaDetailPage extends StatelessWidget {
  const QaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    QaDetailController qa = QaDetailController();

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomInfoAction(
          post: qa.data.value, // 帖子数据
          thumbTargetType: ThumbTargetTypeEnum.qa.value, // 点赞类型
          favourTargetType: FavourTargetTypeEnum.qa.value, // 收藏类型
          commentTargetType: CommentTypeEnum.qa.value,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [_buildAppBar(qa)],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 用户信息【通用的公共组件】
              Obx(() => UserInfo(user: qa.data.value.user)),
              // 文章内容
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                    () => MdViewer(content: qa.data.value.content ?? '')),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              //   child: Obx(
              //     () => PictureList(
              //       pictureList: qa.data.value.pictureList ?? [],
              //       grow: true,
              //     ),
              //   ),
              // ),
              _buildTags(qa),
              _buildPublishTime(qa),
              ..._buildSplitter(),
              _buildCommentList(qa),
            ],
          ),
        ),
      ),
    );
  }

  // 标题栏
  _buildAppBar(qa) {
    return SliverAppBar(
      title: Obx(() => Text(qa.data.value.title ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      floating: true,
      snap: true,
    );
  }

  // 评论列表
  _buildCommentList(qa) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => CommentList(
          data: qa.data.value,
          targetType: CommentTypeEnum.qa.value,
        ),
      ),
    );
  }

  // 标签
  _buildTags(QaDetailController qa) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => TagList(tags: qa.data.value.tags ?? []),
      ),
    );
  }

  // 发布时间
  _buildPublishTime(qa) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Text(
          formatTimeFromNow(qa.data.value.createTime ?? 0),
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
