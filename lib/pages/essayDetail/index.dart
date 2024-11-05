import 'package:flutter/material.dart';
import 'package:codefather_app/components/bottom_info_action/index.dart';
import 'package:codefather_app/components/comment_list/index.dart';
import 'package:codefather_app/components/md_viewer/index.dart';
import 'package:codefather_app/components/my_divider/index.dart';
import 'package:codefather_app/components/picture_list/index.dart';
import 'package:codefather_app/components/user_info/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/constants/comment.dart';
import 'package:codefather_app/constants/favour.dart';
import 'package:codefather_app/constants/thumb.dart';
import 'package:codefather_app/pages/essayDetail/controller.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 帖子详情页
class EssayDetailPage extends StatelessWidget {
  const EssayDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    EssayDetailController essay = EssayDetailController();

    essay.getEssayVoById();

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomInfoAction(
          post: essay.data.value, // 帖子数据
          thumbTargetType: ThumbTargetTypeEnum.essay.value, // 点赞类型
          favourTargetType: FavourTargetTypeEnum.essay.value, // 收藏类型
          commentTargetType: CommentTypeEnum.essay.value,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [_buildAppBar(essay)],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 用户信息【通用的公共组件】
              Obx(() => UserInfo(user: essay.data.value.user)),
              // 文章内容
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                    () => MdViewer(content: essay.data.value.content ?? '')),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Obx(() => PictureList(
                    pictureList: essay.data.value.pictureList ?? [])),
              ),
              _buildPublishTime(essay),
              ..._buildSplitter(),
              _buildCommentList(essay),
            ],
          ),
        ),
      ),
    );
  }

  // 标题栏
  _buildAppBar(essay) {
    return SliverAppBar(
      title: Obx(() => Text(essay.data.value.title ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      floating: true,
      snap: true,
    );
  }

  // 评论列表
  _buildCommentList(essay) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => CommentList(
          data: essay.data.value,
          targetType: CommentTypeEnum.essay.value,
        ),
      ),
    );
  }

  // 发布时间
  _buildPublishTime(essay) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Text(
          formatTimeFromNow(essay.data.value.createTime ?? 0),
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
