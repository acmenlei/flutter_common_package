import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/qa/qa_vo_model.dart';
import 'package:get/get.dart';

class QaDetailController {
  String id = Get.arguments?["id"] ?? '';
  Rx<QaVoModel> data = QaVoModel().obs;
  RxList newComments = [].obs; // 用来存储新发的帖子评论

  QaDetailController() {
    getQaVoById();
  }

  getQaVoById() async {
    if (id.isEmpty) {
      return;
    }
    final res = await Http.client.getQaVoById(id);
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
