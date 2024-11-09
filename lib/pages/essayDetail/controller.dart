import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/post/post_vo_model.dart';
import 'package:get/get.dart';

class EssayDetailController {
  String id = Get.arguments?["id"] ?? '';
  Rx<PostVoModel> data = PostVoModel().obs;
  RxList newComments = [].obs; // 用来存储新发的帖子

  getEssayVoById() async {
    final res = await Http.client.getEssayVoById(id);
    if (res.code == 0) {
      data.value = res.data;
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
