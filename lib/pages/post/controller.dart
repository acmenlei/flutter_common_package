import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/post_vo_model.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:get/get.dart';

class PostDetailController {
  String id = Get.arguments?["id"] ?? '';
  Rx<PostVoModel> data = PostVoModel().obs;
  RxList newComments = [].obs; // 用来存储新发的帖子

  getPostVoById() async {
    try {
      final res = await Http.client.getPostVoById(id);
      if (res.code == 0) {
        data.value = res.data;
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }

  // 新评论
  onRefreshComment(newData) {
    newComments.value = [newData, ...newComments];
  }

  // 清空新评论
  onClearNewComment() {
    newComments.clear();
  }
}
