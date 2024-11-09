import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/note/note_model.dart';
import 'package:get/get.dart';

class NoteDetailController {
  String id = Get.arguments?["id"] ?? '';
  Rx<NoteModel> data = NoteModel().obs;
  RxList newComments = [].obs; // 用来存储新发的帖子评论

  NoteDetailController() {
    getNoteVoById();
  }

  getNoteVoById() async {
    if (id.isEmpty) {
      return;
    }
    final res = await Http.client.getNoteVoById(id);
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
