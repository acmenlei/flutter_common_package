import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/comment/comment_model.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:get/get.dart';

/// 单条评论
class CommenItemController {
  final comment = CommentVo().obs;

  CommenItemController(commentData) {
    comment.value = commentData;
  }

  // 刷新单条评论的数据
  onRefresh(data) async {
    if (comment.value.id == null) {
      return;
    }
    try {
      final res = await Http.client
          .getCommentVOByIdUsingGET(comment.value.id.toString());
      if (res.code == 0) {
        comment.value = res.data;
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }
}
