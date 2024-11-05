import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/post_vo_model.dart';
import 'package:codefather_app/components/comment_list/components/comment_item/index.dart';
import 'package:codefather_app/components/comment_list/controller.dart';
import 'package:codefather_app/components/reach_bottom_load_list/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/color.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 评论列表
class CommentList extends StatelessWidget {
  final PostVoModel data; // 评论数据
  final int targetType; // 当前选中的评论类型
  const CommentList({super.key, required this.data, required this.targetType});

  @override
  Widget build(BuildContext context) {
    CommentListController commentListController = CommentListController();
    // print("====commentList build====");
    // targetID不存在的话就不请求数据
    if (data.id == null) {
      return Container();
    }

    commentListController.targetType.value = targetType;
    commentListController.targetId.value = data.id ?? '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCommentHeader(commentListController),
        _buildMainContent(commentListController),
      ],
    );
  }

  // 构建评论列表
  _buildCommentList(commentListController) {
    return Obx(() {
      return ReachBottomLoadList(
        splitter: const SizedBox(height: 16),
        needStartRefresh: false,
        itemGap: 0,
        fetcher: Http.client.listCommentPageUsingPOST,
        searchParams: {
          "targetType": commentListController.targetType.value,
          "targetId": commentListController.targetId.value,
          "reviewStatus": 1,
          "pageSize": 10,
          "current": 1,
          "sortField": commentListController.sortField.value,
          "sortOrder": "descend"
        },
        itemRender: (item) => CommentItem(data: item, targetType: targetType),
      );
    });
  }

  // 评论列表
  _buildMainContent(commentListController) {
    if (data.commentNum == 0) {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 16),
        height: 200,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty_rounded, color: tertiaryColor),
            SizedBox(
              height: 10,
            ),
            Text(
              '还没有人发布评论～',
              style: TextStyle(color: tertiaryColor),
            ),
          ],
        ),
      );
    }
    return _buildCommentList(commentListController);
  }

  // 评论区头部【评论数量文案 & 最新/最热】
  _buildCommentHeader(commentListController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                '全部评论',
                style: TextStyle(color: secondaryColor, fontSize: 16),
              ),
              const SizedBox(width: 5),
              Text(
                '(${data.commentNum ?? 0}条)',
                style: const TextStyle(color: tertiaryColor),
              )
            ],
          ),
          Obx(() {
            return ToggleButtons(
              isSelected: [
                commentListController.selectedSegment.value == 0,
                commentListController.selectedSegment.value == 1,
              ],
              borderRadius: BorderRadius.circular(10),
              constraints: const BoxConstraints(minHeight: 26),
              textStyle: const TextStyle(fontSize: 12),
              color: tertiaryColor,
              selectedColor: getPrimaryFontColor(),
              fillColor: getPrimaryColor(),
              onPressed: commentListController.onPressed,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('最新'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('最热'),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
