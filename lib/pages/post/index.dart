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
import 'package:codefather_app/pages/post/controller.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';

/// 帖子详情页
class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostDetailController post = PostDetailController();
    TocController tocController = TocController();

    post.getPostVoById(); // 获取帖子详情

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomInfoAction(
          post: post.data.value, // 帖子数据
          tocController: tocController, // 目录控制器
          thumbTargetType: ThumbTargetTypeEnum.post.value, // 点赞类型
          favourTargetType: FavourTargetTypeEnum.post.value, // 收藏类型
          commentTargetType: CommentTypeEnum.post.value, // 评论类型
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [_buildAppBar(post)],
          // 不能用listView，否则会懒加载导致不断销毁重建
          body: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Obx(() => UserInfo(user: post.data.value.user)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => MdViewer(
                    content: post.data.value.content ?? '',
                    tocController: tocController,
                  ),
                ),
              ),
              _buildPublishTime(post),
              ..._buildSplitter(),
              _buildCommentList(post),
            ]),
          )),
    );
  }

  _buildAppBar(post) {
    return SliverAppBar(
      title: Obx(
        () => Text(
          post.data.value.title ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floating: true,
      snap: true,
    );
  }

  // 评论列表
  _buildCommentList(post) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(() => CommentList(
            data: post.data.value,
            targetType: CommentTypeEnum.post.value,
          )),
    );
  }

  // 发布时间
  _buildPublishTime(post) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Text(
          formatTimeFromNow(post.data.value.createTime ?? 0),
          style: const TextStyle(color: tertiaryColor),
        ),
      ),
    );
  }

  // 分割线
  _buildSplitter() {
    return [
      const MyDivider(
        color: true,
        margin: 10,
      )
    ];
  }
}


  // CustomScrollView(
  //         slivers: [
  //           SliverAppBar(
  //             title: Obx(() => Text(post.data.value.title ?? '',
  //                 style: const TextStyle(
  //                     fontSize: 16, fontWeight: FontWeight.bold))),
  //             floating: true,
  //             snap: true,
  //           ),
  //           // 用户信息【通用的公共组件】
  //           SliverToBoxAdapter(
  //               child: Obx(() => UserInfo(user: post.data.value.user))),
  //           // 文章内容
  //           SliverPadding(
  //             padding: const EdgeInsets.all(16.0),
  //             sliver: SliverToBoxAdapter(
  //               child: Obx(
  //               () => MdViewer(
  //                 content: post.data.value.content ?? '',
  //                 tocController: tocController,
  //               ),
  //             ),
  //             ),
  //           ),
  //           SliverToBoxAdapter(
  //             child: _buildPublishTime(),
  //           ),
  //           ..._buildSplitter(),
  //           SliverToBoxAdapter(
  //             child: _buildCommentList(),
  //           ),
  //           TocWidget(controller: tocController)
  //         ],
  //       )